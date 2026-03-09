package com.example.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Note", uniqueConstraints = {@UniqueConstraint(columnNames = {"id_candidat", "id_matiere", "id_correcteur"})})
public class Note {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_candidat", nullable = false)
    private Candidat candidat;

    @ManyToOne
    @JoinColumn(name = "id_matiere", nullable = false)
    private Matiere matiere;

    @ManyToOne
    @JoinColumn(name = "id_correcteur", nullable = false)
    private Correcteur correcteur;

    @Column(nullable = false)
    private Double note;

    public Note() {}

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Candidat getCandidat() { return candidat; }
    public void setCandidat(Candidat candidat) { this.candidat = candidat; }
    public Matiere getMatiere() { return matiere; }
    public void setMatiere(Matiere matiere) { this.matiere = matiere; }
    public Correcteur getCorrecteur() { return correcteur; }
    public void setCorrecteur(Correcteur correcteur) { this.correcteur = correcteur; }
    public Double getNote() { return note; }
    public void setNote(Double note) { this.note = note; }
}
