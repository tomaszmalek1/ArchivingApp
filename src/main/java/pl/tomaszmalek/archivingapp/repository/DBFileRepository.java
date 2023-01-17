package pl.tomaszmalek.archivingapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.tomaszmalek.archivingapp.model.DBFile;

@Repository
public interface DBFileRepository extends JpaRepository<DBFile, String> {
}
