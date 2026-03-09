package com.example.controller;

import com.example.dao.MatiereDAO;
import com.example.model.Matiere;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/matieres")
public class MatiereController {

    @Autowired
    private MatiereDAO matiereDAO;

    @GetMapping
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView("admin/matieres/list");
        mav.addObject("matieres", matiereDAO.findAll());
        mav.addObject("titre", "Gestion des Matières");
        return mav;
    }

    @GetMapping("/nouveau")
    public ModelAndView showForm() {
        ModelAndView mav = new ModelAndView("admin/matieres/form");
        mav.addObject("matiere", new Matiere());
        mav.addObject("action", "Créer");
        return mav;
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Matiere matiere, RedirectAttributes ra) {
        matiereDAO.save(matiere);
        ra.addFlashAttribute("message", "Matière enregistrée avec succès");
        return "redirect:/admin/matieres";
    }

    @GetMapping("/modifier/{id}")
    public ModelAndView edit(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView("admin/matieres/form");
        mav.addObject("matiere", matiereDAO.findById(id).orElse(null));
        mav.addObject("action", "Modifier");
        return mav;
    }

    @GetMapping("/supprimer/{id}")
    public String delete(@PathVariable Long id, RedirectAttributes ra) {
        matiereDAO.deleteById(id);
        ra.addFlashAttribute("message", "Matière supprimée");
        return "redirect:/admin/matieres";
    }
}
