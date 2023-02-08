package pl.tomaszmalek.archivingapp.controller;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pl.tomaszmalek.archivingapp.exceptions.MyFileNotFoundException;
import pl.tomaszmalek.archivingapp.model.Case;
import pl.tomaszmalek.archivingapp.model.DBFile;
import pl.tomaszmalek.archivingapp.model.Document;
import pl.tomaszmalek.archivingapp.repository.CaseRepository;
import pl.tomaszmalek.archivingapp.repository.DocumentRepository;
import pl.tomaszmalek.archivingapp.service.CaseService;
import pl.tomaszmalek.archivingapp.service.DBFileStorageService;
import pl.tomaszmalek.archivingapp.service.DocumentService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Comparator;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.stream.Collectors;


@Controller
public class HomeController {
    private final CaseService caseService;
    private final DocumentService documentService;
    private final DocumentRepository documentRepository;
    private final CaseRepository caseRepository;
    private final DBFileStorageService dbFileStorageService;

    public HomeController(CaseService caseService, DocumentService documentService, DocumentRepository documentRepository, CaseRepository caseRepository, DBFileStorageService dbFileStorageService) {
        this.caseService = caseService;
        this.documentService = documentService;
        this.documentRepository = documentRepository;
        this.caseRepository = caseRepository;
        this.dbFileStorageService = dbFileStorageService;
    }

    @RequestMapping("/")
    public String dashboard() {
        return "index";
    }

    @GetMapping("/addCase")
    public String addCase(Model model) {
        model.addAttribute("case", new Case());
        return "addCase";
    }

    @PostMapping("/addCase")
    public String addCase(@Valid Case aCase, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "/addCase";
        }
        caseService.save(aCase);
        return "redirect:/casesList";
    }

    @GetMapping("/addDocument")
    public String addDocument(Model model, HttpSession ses) {
        ses.removeAttribute("documentDetails");
        model.addAttribute("document", new Document());
        model.addAttribute("cases", caseService.getAll());
        return "addDocument";
    }

    @PostMapping("/addDocument")
    public String addDocument(@Valid Document document, BindingResult bindingResult, @RequestParam("file") MultipartFile file, HttpSession ses, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("cases", caseService.getAll());
            return "addDocument";
        } else if (!file.isEmpty()) {
            DBFile dbFile = dbFileStorageService.storeFile(file);
            document.setDbFile(dbFile);
        }
        documentService.save(document);
        ses.setAttribute("documentDetails", document);
        return "documentDetails";
    }

    @PostMapping("/addAttachment")
    public String addAttachment(HttpSession ses, @RequestParam("file") MultipartFile file) {
        Document document = (Document) ses.getAttribute("documentDetails");
        if (!file.isEmpty()) {
            DBFile dbFile = dbFileStorageService.storeFile(file);
            document.setDbFile(dbFile);
        }
        documentService.save(document);
        return "documentDetails";
    }

    @GetMapping("/downloadFile/{fileId}")
    public ResponseEntity<Resource> downloadFile(@PathVariable String fileId) {
        try {
            DBFile dbFile = dbFileStorageService.getFile(fileId);
            return ResponseEntity.ok()
                    .contentType(MediaType.parseMediaType(dbFile.getFileType()))
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + dbFile.getFileName() + "\"")
                    .body(new ByteArrayResource(dbFile.getData()));
        } catch (MyFileNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    @GetMapping("/casesList")
    public String casesList(Model model) {
        List<Case> allCases = caseService.getAll()
                .stream()
                .sorted(Comparator.comparing(Case::getCaseSign))
                .collect(Collectors.toList());
        model.addAttribute("allCases", allCases);
        return "casesList";
    }

    @GetMapping("/documentsList/{oneCaseId}")
    public String documentsList(@PathVariable("oneCaseId") Long id, Model model) {
        try {
            List<Document> documentByCaseSign = documentRepository.findDocumentByCaseSignId(id);
            Optional<Case> aCase = caseService.getById(id);
            model.addAttribute("caseSign", aCase.get().getCaseSign());
            model.addAttribute("documentsList", documentByCaseSign);
        } catch (NoSuchElementException e) {
            e.printStackTrace();
            return "redirect:/casesList";
        }
        return "documentsList";
    }

    @GetMapping("/documentDetails/{documentId}/{oneCaseId}")
    public String documentDetails(@PathVariable long documentId, @PathVariable Long oneCaseId, HttpSession ses) {
        try {
            Optional<Document> document = documentService.getById(documentId);
            ses.setAttribute("documentDetails", document.get());
        } catch (NoSuchElementException e) {
            e.printStackTrace();
            return "redirect:/documentsList/" + oneCaseId;
        }
        return "documentDetails";
    }

    @PostMapping("/searchByCaseSign")
    public String searchByCaseSign(@RequestParam String caseSign) {
        try {
            return "redirect:/documentsList/" + caseRepository.findCaseByCaseSign(caseSign).getId();
        } catch (NullPointerException e) {
            e.printStackTrace();
            return "redirect:/";
        }
    }
}