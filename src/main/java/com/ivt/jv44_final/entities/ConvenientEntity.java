/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.entities;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 *
 * @author KT
 */
@Entity
@Table(name = "convenient")
public class ConvenientEntity implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(length = 100)
    private String name;

    @Column(length = 1000)
    private String description;
    
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(name = "roomType_convenient_relationship",
            joinColumns = @JoinColumn(name = "convenient_id",
                    referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(
                    name = "room_type_id",
                    referencedColumnName = "id"))
    private Set<RoomTypeEntity> roomTypes;

    public ConvenientEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Set<RoomTypeEntity> getRoomTypes() {
        return roomTypes;
    }

    public void setRoomTypes(Set<RoomTypeEntity> roomTypes) {
        this.roomTypes = roomTypes;
    }
    
    
}
