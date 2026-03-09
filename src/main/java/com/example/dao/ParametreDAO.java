package com.example.dao;

import com.example.model.Parametre;
import com.example.model.Matiere;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface ParametreDAO extends JpaRepository<Parametre, Long> {
    Optional<Parametre> findByMatiere(Matiere matiere);
}
