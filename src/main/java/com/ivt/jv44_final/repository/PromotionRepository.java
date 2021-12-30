/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.repository;

import com.ivt.jv44_final.entities.PromotionEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author KT
 */
@Repository
public interface PromotionRepository extends CrudRepository<PromotionEntity, Integer>{
    
}
