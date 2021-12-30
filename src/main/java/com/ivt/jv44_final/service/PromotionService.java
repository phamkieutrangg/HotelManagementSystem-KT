/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.service;

import com.ivt.jv44_final.entities.PromotionEntity;
import com.ivt.jv44_final.repository.PromotionRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author KT
 */
@Service
public class PromotionService {
    
    @Autowired
    private PromotionRepository promotionRepository;
    
    public List<PromotionEntity> getPromotions(){
        return (List<PromotionEntity>) promotionRepository.findAll();
    }
    
    public void savePromotion(PromotionEntity promotion) {
       promotionRepository.save(promotion);
    }
    
    public PromotionEntity getPromotion(int promotionId) {
        Optional<PromotionEntity> optional = promotionRepository.findById(promotionId);
       if(optional.isPresent()){
           return optional.get();
       }
       return null;
    }
}
