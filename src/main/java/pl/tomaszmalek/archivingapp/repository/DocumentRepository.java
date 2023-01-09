package pl.tomaszmalek.archivingapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.tomaszmalek.archivingapp.model.Document;

public interface DocumentRepository extends JpaRepository<Document, Long> {
}
