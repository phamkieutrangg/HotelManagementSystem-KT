/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.service;

import java.util.Properties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

/**
 *
 * @author KT
 */
@Service
public class Mail {

    @Autowired
    private JavaMailSender emailSender;

    public void sendMail(
            String to, String subject, String text) {
       
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("trang.cinematiclife@gmail.com");
        message.setTo(to);
        message.setSubject(subject);
        message.setText(text);
        emailSender.send(message);

    }
}
