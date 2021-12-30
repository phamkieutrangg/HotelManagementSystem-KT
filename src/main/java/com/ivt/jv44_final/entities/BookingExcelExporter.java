/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.entities;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.BuiltinFormats;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author KT
 */
public class BookingExcelExporter {

    private XSSFWorkbook workbook;
    private XSSFSheet sheet;

    private List<BookingEntity> bookings;
    //private BookingDetailEntity bookingDetail;

    public BookingExcelExporter(List<BookingEntity> bookings) {
        this.bookings = bookings;
        workbook = new XSSFWorkbook();
        sheet = workbook.createSheet("Bookings");
    }

    private void writeHeaderRow() {
        Row row = sheet.createRow(0);

        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setBold(true);
        font.setFontHeight(16);
        style.setFont(font);

        Cell cell = row.createCell(0);
        cell.setCellValue("Full Name");
        cell.setCellStyle(style);

        cell = row.createCell(1);
        cell.setCellValue("Booking Date");
        cell.setCellStyle(style);

        cell = row.createCell(2);
        cell.setCellValue("Check In");
        cell.setCellStyle(style);

        cell = row.createCell(3);
        cell.setCellValue("Check Out");
        cell.setCellStyle(style);

        cell = row.createCell(4);
        cell.setCellValue("Booking Status");
        cell.setCellStyle(style);

        cell = row.createCell(5);
        cell.setCellValue("Total Price");
        cell.setCellStyle(style);
    }

    private void writeDataRow() {
        int rowCount = 1;

        for (BookingEntity booking : bookings) {

            Row row = sheet.createRow(rowCount++);

            CellStyle style = workbook.createCellStyle();
            XSSFFont font = workbook.createFont();
            font.setFontHeight(16);
            style.setFont(font);
            DecimalFormat formatter = new DecimalFormat("###,###,###");

            Cell cell = row.createCell(0);
            cell.setCellValue(booking.getUser().getFullName());
            sheet.autoSizeColumn(0);
            cell.setCellStyle(style);

            cell = row.createCell(1);
            cell.setCellValue(booking.getBookingDate().toString());
            sheet.autoSizeColumn(1);
            cell.setCellStyle(style);

            cell = row.createCell(2);
            cell.setCellValue(booking.getCheckin().toString());
            sheet.autoSizeColumn(2);
            cell.setCellStyle(style);

            cell = row.createCell(3);
            cell.setCellValue(booking.getCheckout().toString());
            sheet.autoSizeColumn(3);
            cell.setCellStyle(style);

            cell = row.createCell(4);
            cell.setCellValue(booking.getStatus().toString());
            sheet.autoSizeColumn(4);
            cell.setCellStyle(style);

            cell = row.createCell(5);
            cell.setCellValue(formatter.format(booking.getTotalPrice())+"VND");
            sheet.autoSizeColumn(5);
            cell.setCellStyle(style);

            row = sheet.createRow(rowCount++);
            writeHeaderRow();
            style = workbook.createCellStyle();
            font = workbook.createFont();
            font.setBold(true);
            font.setFontHeight(13);
            style.setFont(font);

            cell = row.createCell(1);
            cell.setCellValue("Room");
            cell.setCellStyle(style);

            cell = row.createCell(2);
            cell.setCellValue("Price Of Room");
            cell.setCellStyle(style);

            cell = row.createCell(3);
            cell.setCellValue("Number Of Services");
            cell.setCellStyle(style);

            cell = row.createCell(4);
            cell.setCellValue("Price Of Services");
            cell.setCellStyle(style);

            cell = row.createCell(5);
            cell.setCellValue("Total Price");
            cell.setCellStyle(style);

            for (BookingDetailEntity bookingDetail : booking.getBookingDetails()) {

                row = sheet.createRow(rowCount++);

                style = workbook.createCellStyle();
                font = workbook.createFont();
                font.setFontHeight(16);
                style.setFont(font);        

                cell = row.createCell(1);
                cell.setCellValue(bookingDetail.getRoom().getRoomType().getName() + " " + bookingDetail.getRoom().getRoomNumber());
                sheet.autoSizeColumn(1);
                cell.setCellStyle(style);

                cell = row.createCell(2);
                cell.setCellValue(formatter.format(bookingDetail.getPrice() - bookingDetail.getPrice() * bookingDetail.getDiscount() / 100)+"VND");
                sheet.autoSizeColumn(2);
                cell.setCellStyle(style);

                cell = row.createCell(3);
                cell.setCellValue(bookingDetail.getServiceBooking().size());
                sheet.autoSizeColumn(3);
                cell.setCellStyle(style);

                int priceServiceBooking = 0;
                for (ServiceBookingEntity serviceBooking : bookingDetail.getServiceBooking()) {
                    priceServiceBooking += serviceBooking.getQuantity()*serviceBooking.getService().getPrice();
                    
                }
                cell = row.createCell(4);
                cell.setCellValue(formatter.format(priceServiceBooking)+"VND");
                sheet.autoSizeColumn(4);
                cell.setCellStyle(style);

                
                cell = row.createCell(5);
                cell.setCellValue(formatter.format((bookingDetail.getPrice() - bookingDetail.getPrice() * bookingDetail.getDiscount() / 100) + priceServiceBooking) +"VND");
                sheet.autoSizeColumn(5);
                cell.setCellStyle(style);
            }

        }
    }

    public void export(HttpServletResponse response) throws IOException {
        writeHeaderRow();
        writeDataRow();

        ServletOutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();

        outputStream.close();

    }

}
