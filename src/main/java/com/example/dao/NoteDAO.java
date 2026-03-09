package com.example.dao;

import com.example.model.Note;
import com.example.model.Candidat;
import com.example.model.Matiere;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface NoteDAO extends JpaRepository<Note, Long> {
    List<Note> findByCandidatAndMatiere(Candidat candidat, Matiere matiere);
}
