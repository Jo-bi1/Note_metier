package com.example.controller;

import com.example.dao.CandidatDAO;
import com.example.dao.MatiereDAO;
import com.example.model.Candidat;
import com.example.model.Matiere;
import com.example.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ResultController {

    @Autowired
    private CandidatDAO candidatDAO;

    @Autowired
    private MatiereDAO matiereDAO;

    @Autowired
    private NoteService noteService;

    @GetMapping("/")
    public String index() {
        return "redirect:/notes";
    }

    @GetMapping("/notes")
    public ModelAndView displayResults() {
        ModelAndView mav = new ModelAndView("front/notes-display");
        List<Candidat> candidats = candidatDAO.findAll();
        List<Matiere> matieres = matiereDAO.findAll();
        
        Map<Long, Map<Long, Double>> results = new HashMap<>();
        
        for (Candidat c : candidats) {
            Map<Long, Double> row = new HashMap<>();
            for (Matiere m : matieres) {
                row.put(m.getId(), noteService.calculerNoteFinale(c, m));
            }
            results.put(c.getId(), row);
        }
        
        mav.addObject("candidats", candidats);
        mav.addObject("matieres", matieres);
        mav.addObject("results", results);
        mav.addObject("titre", "Résultats des Examens");
        
        return mav;
    }
}
