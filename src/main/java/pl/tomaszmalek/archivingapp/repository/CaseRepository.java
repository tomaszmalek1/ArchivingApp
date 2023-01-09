package pl.tomaszmalek.archivingapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.tomaszmalek.archivingapp.model.Case;

public interface CaseRepository extends JpaRepository<Case, Long> {

}
