package pl.tomaszmalek.archivingapp.service;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import pl.tomaszmalek.archivingapp.model.Document;
import pl.tomaszmalek.archivingapp.repository.DocumentRepository;

import java.util.List;
import java.util.Optional;

@Service
@Primary
public class JpaDocumentService implements DocumentService {
    private final DocumentRepository documentRepository;

    public JpaDocumentService(DocumentRepository documentRepository) {
        this.documentRepository = documentRepository;
    }


    @Override
    public void save(Document document) {
        documentRepository.save(document);
    }

    @Override
    public void delete(long id) {
        documentRepository.deleteById(id);
    }

    @Override
    public List<Document> getAll() {
        return documentRepository.findAll();
    }

    @Override
    public Optional<Document> getById(long id) {
        return documentRepository.findById(id);
    }
}
