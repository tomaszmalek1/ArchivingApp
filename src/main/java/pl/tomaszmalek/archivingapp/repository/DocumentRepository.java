package pl.tomaszmalek.archivingapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.tomaszmalek.archivingapp.model.Document;
@Repository
public interface DocumentRepository extends JpaRepository<Document, Long> {
}
