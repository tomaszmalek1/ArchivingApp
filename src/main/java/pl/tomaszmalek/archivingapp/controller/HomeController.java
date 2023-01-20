package pl.tomaszmalek.archivingapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import pl.tomaszmalek.archivingapp.model.Case;
import pl.tomaszmalek.archivingapp.model.DBFile;
import pl.tomaszmalek.archivingapp.model.Document;
import pl.tomaszmalek.archivingapp.service.CaseService;
import pl.tomaszmalek.archivingapp.service.DBFileStorageService;
import pl.tomaszmalek.archivingapp.service.DocumentService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;


@Controller
public class HomeController {
    private final CaseService caseService;
    private final DocumentService documentService;

    @Autowired
    private DBFileStorageService dbFileStorageService;

    public HomeController(CaseService caseService, DocumentService documentService) {
        this.caseService = caseService;
        this.documentService = documentService;
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

    @PostMapping("addCase")
    public String addCase(@Valid Case aCase, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "/addCase";
        }
        caseService.save(aCase);
        return "redirect:/";
    }

    @GetMapping("/addDocument")
    public String addDocument(Model model) {
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
        return "/documentDetails";
        //poczyścić sesje gdzieś
    }
}