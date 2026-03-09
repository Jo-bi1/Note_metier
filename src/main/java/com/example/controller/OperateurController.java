package com.example.controller;

import com.example.dao.OperateurDAO;
import com.example.model.Operateur;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/operateurs")
public class OperateurController {

    @Autowired
    private OperateurDAO operateurDAO;

    @GetMapping
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView("admin/operateurs/list");
        mav.addObject("operateurs", operateurDAO.findAll());
        mav.addObject("titre", "Gestion des Opérateurs");
        return mav;
    }

    @GetMapping("/nouveau")
    public ModelAndView showForm() {
        ModelAndView mav = new ModelAndView("admin/operateurs/form");
        mav.addObject("operateur", new Operateur());
        mav.addObject("action", "Créer");
        return mav;
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Operateur operateur, RedirectAttributes ra) {
        operateurDAO.save(operateur);
        ra.addFlashAttribute("message", "Opérateur enregistré avec succès");
        return "redirect:/admin/operateurs";
    }

    @GetMapping("/modifier/{id}")
    public ModelAndView edit(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView("admin/operateurs/form");
        mav.addObject("operateur", operateurDAO.findById(id).orElse(null));
        mav.addObject("action", "Modifier");
        return mav;
    }

    @GetMapping("/supprimer/{id}")
    public String delete(@PathVariable Long id, RedirectAttributes ra) {
        operateurDAO.deleteById(id);
        ra.addFlashAttribute("message", "Opérateur supprimé");
        return "redirect:/admin/operateurs";
    }
}
