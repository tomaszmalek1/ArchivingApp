package pl.tomaszmalek.archivingapp.service;

import pl.tomaszmalek.archivingapp.model.Document;

import java.util.List;
import java.util.Optional;

public interface DocumentService {
    void save(Document document);

    void delete(long id);

    List<Document> getAll();

    Optional<Document> getById(long id);
}
