package pl.tomaszmalek.archivingapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pl.tomaszmalek.archivingapp.model.Case;
import pl.tomaszmalek.archivingapp.model.DBFile;
import pl.tomaszmalek.archivingapp.model.Document;
import pl.tomaszmalek.archivingapp.repository.DocumentRepository;
import pl.tomaszmalek.archivingapp.service.CaseService;
import pl.tomaszmalek.archivingapp.service.DBFileStorageService;
import pl.tomaszmalek.archivingapp.service.DocumentService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;
import java.util.Optional;


@Controller
public class HomeController {
    private final CaseService caseService;
    private final DocumentService documentService;
    private final DocumentRepository documentRepository;
    @Autowired
    private DBFileStorageService dbFileStorageService;

    public HomeController(CaseService caseService, DocumentService documentService, DocumentRepository documentRepository) {
        this.caseService = caseService;
        this.documentService = documentService;
        this.documentRepository = documentRepository;
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
        return "redirect:/";
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
        }
        if (!file.isEmpty()) {
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

    @GetMapping("/casesList")
    public String casesList(Model model) {
        List<Case> allCases = caseService.getAll();
        model.addAttribute("allCases", allCases);
        return "casesList";
    }

    @GetMapping("/documentsList/{oneCaseId}")
    public String documentsList(@PathVariable("oneCaseId") Long id, Model model) {
        List<Document> documentByCaseSign = documentRepository.findDocumentByCaseSign(id);
        model.addAttribute("documentsList", documentByCaseSign);
        return "documentsList";
    }

    @GetMapping("/documentDetails/{documentId}")
    public String documentDetails(@PathVariable long documentId, HttpSession ses) {
        Optional<Document> document = documentService.getById(documentId);
        ses.setAttribute("documentDetails", document.get());
        return "documentDetails";
    }
}