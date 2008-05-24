<!--
    Program: PBooks
    Component: dynamic.css.xsl
    Copyright: Savonix Corporation
    Author: Albert L. Lash, IV
    License: Gnu Affero Public License version 3
    http://www.gnu.org/licenses
    
    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation; either version 3 of the License, or
    (at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.
    
    You should have received a copy of the GNU Affero General Public License
    along with this program; if not, see http://www.gnu.org/licenses
    or write to the Free Software Foundation,Inc., 51 Franklin Street,
    Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="text" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>
<xsl:template match="/">

<xsl:if test="//path_prefix='/demo/'">
.webads iframe {
    overflow-x: hidden;
    overflow-y: hidden;
}
</xsl:if>

<xsl:call-template name="thematic-button">
    <xsl:with-param name="button-name">basic-blue</xsl:with-param>
    <xsl:with-param name="background-color">#F1F1F1</xsl:with-param>
    <xsl:with-param name="color">#0066B9</xsl:with-param>
</xsl:call-template>
<xsl:call-template name="thematic-button">
    <xsl:with-param name="button-name">basic-green</xsl:with-param>
    <xsl:with-param name="background-color">#66FF99</xsl:with-param>
    <xsl:with-param name="color">#009900</xsl:with-param>
</xsl:call-template>
<xsl:call-template name="thematic-button">
    <xsl:with-param name="button-name">basic-black</xsl:with-param>
    <xsl:with-param name="background-color">grey</xsl:with-param>
    <xsl:with-param name="color">black</xsl:with-param>
</xsl:call-template>


/* ALL OLD CSS - SHOULD BE REPLACED ASAP */

html, body {
    color: black;
    background: white;
    font-weight: normal;
    font-style: normal;
    text-decoration: none;
    margin: 0;
    padding: 0;
    border: 0;
    font-family: Arial, Helvetica, sans-serif; 
    min-height: 600px;
    font: x-small sans-serif;
}

/* Take from wikipedia, but doesn't seem to work...
** Font size:
** We take advantage of keyword scaling- browsers won't go below 9px
** More at http://www.w3.org/2003/07/30-font-size
** http://style.cleverchimp.com/font_size_intervals/altintervals.html
*/
body { 
    font-size: 110%;
}
img { 
    border: 0;
}

td
{
    background-color: #FFF;
    vertical-align: top;
}

select {border:1px solid #666; font-size: 100%;}

input, textarea
{
     border: 1px solid #666;
     padding: 2px;
}
#container {
    width: 85em;
    border: 10px;
    border-style: solid;
    border-color: #FFF;
}

#capsule {
    min-height: 65em;
    width: 100%;
    background: #AAA;
}

#header {
    width: 74em; border: 0px; margin-left: 10.5em;
    background: #FFF;
    min-height: 65em;
}

#top-block {
    height: 5.4em; background: #777; letter-spacing: 1px; display: block;
}
#leftcol {
    background: #AAA; width: 10.5em; float: left;
}

#company-name { 
    text-align: right; padding-right: 10px; color: #EEE;  position: relative;
}
#print-button { 
    float: right; padding: 20px; padding-top: 50px; color: red; position: relative;

}

.page-title {
    padding: 10px; color: #EEE; font-size: 18px; 
    margin-top: -8px;
}

#content {
    padding: 10px;
}

#foot {
    width: 100%; display: block; background: #555; text-align: center; color: #FFF; line-height: 20px;
}

#journal-entry-form table
{
     width: 100%;
     text-align: center;
     font-size: 12px;
}

#journal-entry-form tr td
{
     text-align: left;
     padding: 5px;
}

.journal-table
{
     border: 0;
     width: 100%;
     padding: 2px; 
     border-spacing: 0px;
}

.journal-table thead th
{
    background-color: #EEEEEE;
    font-weight: bold;
    text-align: left;
}

.journal-table tbody tr td
{
    height: 24px;
	white-space: nowrap;
	border-style: solid;
	border-color: #CCCCCC;
    border-width: 0;
    border-top-width: 1px;
    padding: 2px;
    vertical-align: middle;
}

.journal-table tbody tr td.separator
{
    height: 4px;
    background-color: #BBBBBB;
	border-color: #555555;
    border-bottom-width: 1px;
}

.journal-table tbody tr td.row0
{
	border-color: #FFFFFF;
}

.journal-table tbody tr td.row1
{
	border-color: #EEEEEE;
}

.journal-data-wrap td
{
	white-space: normal;
}
/* alternate colored rows */
.row0 td
{
	background-color: #FFFFFF;
}

.row1 td
{
	background-color: #EEEEEE;
}

.row2 td
{
	background-color: #DDDDDD;
    margin: 1px;
    
}
.row2:hover td { background-color : #CCFFFF }

.row3 td 
{
	background-color: #f0f0f0;
}

.row4 td 
{
	background-color: #CCC;
}

a {
 color: #222222; text-decoration: none;
}

a:visited {
 color: #222222; text-decoration: none;
}

a:hover {
 color: #44BBDD; text-decoration: underline;
}

.menu-main
{
	font-style: normal;
	line-height: 18px;
	font-weight: bold;
	color: black;
}

.basic-table-cell, .basic-table-cell-indent
{

    align: left;
    color: black;
    font-style: normal;
	text-indent:2px;
	white-space: nowrap;
    padding: 2px;
}

.basic-table-cell-indent
{
	border-left-color: #FFFFFF;
    border-left-width: 20px;
	text-indent:0px;
}

.menu-sub, .menu-sub-selected, .menu-sub-sub-selected, .menu-sub-sub-selected-gray
{
    align: left;
    color: black;
	text-indent:0px;
	white-space: nowrap;
	background: #CCC;
    padding: 5px;
}

.menu-sub-selected
{
    background-color: #99CCCC;
}

.menu-sub-sub-selected
{
    background-color: #BBB;
    color: #444;
}

.menu-sub-sub-selected-gray
{
    font-weight: bold;
    background-color: #DDDDDD;
}

.application-table, .table-menu, .form-table, .journal-table
{
}

.data-table td { 
    border-bottom-width: 1px;
    border-bottom-color: white;
	border-bottom-style: solid;
}

.sm_indent {
    padding-left: 15px;
}

.error {
    font-size: 104%; color: red; border: 1px; border-color: #FF6699; border-style: solid; background: #FFCCFF; line-height: 32px;
    text-align: center;
}

.error img {
    margin-bottom: -3px; padding-right: 5px;
}

.myerror {
    border: 1px; border-color: #FF6699; border-style: solid;
}

.generic-box {
    border: 2px; border-color: #BBB; border-style: solid; text-align: center;
    margin-top: 20px; padding: 4px; 
    display: table; margin-left: auto; margin-right: auto;
}

.generic-button {
    text-align: center;
    margin-left: 5px;
}

.generic-button a {
    padding: 2px 5px 2px 5px;
    border: 2px; border-style: solid;
    border-color: #BBB;
    text-align: center;
}

.generic-button img {
    margin-bottom: -4px; margin-right: 6px;
}

a.generic-button {
    padding: 2px 5px 2px 5px; border: 2px; border-style: solid; border-color: #BBB;
    text-align: center;
}

/* Check form */
#check {
    width: 500px; height: 200px; border: 1px; border-style: solid; padding: 5px;
}

#check_date {float: left}
#check_number { float: right; }
#check_payee { margin-top: 60px; }
#check_memo { margin-top: 80px; }

/* Deposit slip */
#deposit {
width: 500px; height: 200px; border: 1px; border-style: solid; padding: 5px;
}

#deposit_date {float: left}
#deposit_number { float: right; }
#deposit_payee { margin-top: 40px; float:right; }
#deposit_memo { float:right;}

/* Bill form */
#bill { 
width: 500px; height: 200px; border: 1px; border-style: solid; padding: 5px;
}
#bill_date {float: left}
#bill_number { float: right; }
#bill_payee { margin-top: 60px; float:right; }
#bill_memo { margin-top: 120px; }



.journal-post-plus {
    height: 17px;
    width: 17px;
    text-align: center;
    color: white;
}

/* tables */
.simpletable {
    background-color: #222;
    border-collapse: collapse;
}
table.simpletable thead th, table.simpletable tbody tr td {
	background-color: #FFF;
    text-align: left;
    padding: 4px;
    margin: 0px;
    border: 1px;
    border-color: #555;
    border-style: solid;
}

/* INCLUDED FROM jquery.date_input.js */
/* Some resets for compatibility with existing CSS */
.date_selector, .date_selector * {
    width: auto;
    height: auto;
    border: none;
    background: none;
    margin: 0;
    padding: 0;
    text-align: left;
    text-decoration: none;
}
.date_selector {
    background: #F2F2F2;
    border: 1px solid #bbb;
    padding: 5px;
    margin: -1px 0 0 0;
}
.date_selector .month_nav {
    margin: 0 0 5px 0;
    padding: 0;
    display: block;
}
.date_selector .month_name {
    font-weight: bold;
    line-height: 20px;
    display: block;
    text-align: center;
}
.date_selector .month_nav a {
    display: block;
    position: absolute;
    top: 5px;
    width: 20px;
    height: 20px;
    line-height: 17px;
    font-weight: bold;
    color: #003C78;
    text-align: center;
    font-size: 120%;
    overflow: hidden;
}
.date_selector .month_nav a:hover, .date_selector .month_nav a:focus {
    background: none;
    color: #003C78;
    text-decoration: none;
}
.date_selector .prev {
    left: 5px;
}
.date_selector .next {
    right: 5px;
}
.date_selector table {
    border-spacing: 0;
    border-collapse: collapse;
}
.date_selector th, .date_selector td {
    width: 2.5em;
    height: 2em;
    padding: 0;
    text-align: center;
}
.date_selector td {
    border: 1px solid #ccc;
    line-height: 2em;
    text-align: center;
    white-space: nowrap;
    background: white;
}
.date_selector td.today {
    background: #FFFED9;
}
.date_selector td.unselected_month {
    color: #ccc;
}
.date_selector td a {
    display: block;
    text-decoration: none !important;
    width: 100%;
    height: 100%;
    line-height: 2em;
    color: #003C78;
    text-align: center;
}
.date_selector td.today a {
    background: #FFFEB3;
}
.date_selector td.selected a {
    background: #D8DFE5;
    font-weight: bold;
}
.date_selector td a:hover {
    background: #003C78;
    color: white;
}
/* END INCLUDE FROM date_input.js */
/* END OLD CSS */


</xsl:template>



<xsl:template name="thematic-button">
<xsl:param name="button-name"/>
<xsl:param name="background-color"/>
<xsl:param name="color"/>
.button-<xsl:value-of select="$button-name"/>
{
    padding: .2em .4em;
    background-color: <xsl:value-of select="$background-color"/>;
    color: <xsl:value-of select="$color"/>;
    font-weight: bold;
    border-style: solid;
    border-width: 1px;
    border-color: <xsl:value-of select="$color"/>;
    margin: .5em;
    cursor: pointer;
}
</xsl:template>



</xsl:stylesheet>