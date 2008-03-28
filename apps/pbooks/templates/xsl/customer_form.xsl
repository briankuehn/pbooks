<!--
Program: PBooks
Component: customer_form.xsl
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
Fifth Floor, Boston, MA 02110-1301  USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:import href="main.xsl"/>
<xsl:import href="accounting_menu.xsl"/>
<xsl:template name="content">

<!-- The form is validated via a javascript library included in the end of main.xsl. 
Form input elements have attributes like required="1" if they are to be validated. -->
<form method="post" action="{//request_uri}" 
    onSubmit="return validateStandard(this, 'myerror');">

<!-- 
        Check if the user is creating a new account 
        or editing and existing one, 
        and set appropriate parameter "my_action" 
-->
<xsl:if test="//get_account/id">
    <input type="hidden" name="my_action" value="update"/>
    <input type="hidden" value="{//get_account/id}" name="account_id"/>
</xsl:if>
<xsl:if test="not(//get_account/id)">
    <input type="hidden" name="my_action" value="create"/>
</xsl:if>

<!-- If there is already an account with the same name, display error. -->
<xsl:if test="//account_duplicate_check">
<div class="error" id="my_error">
    <img src="{//path_prefix}{//icon_set}/exclamation.png"/>
    Error: <xsl:value-of select="//error[key='account_duplicate']/value"/>
</div>
</xsl:if>
<!-- End error -->

<input type="hidden" name="account_type_id" value="10000"/>


<table class="form-table" cellpadding="10">
	<tr>
		<td><xsl:value-of select="//label[key='customer_name']/value"/>:</td>
		<td><input type="text" name="name" value="{//get_account/name|//_post/name}"  
        required="1" err="{//error[key='missing_account_name']/value}"/></td>
	</tr>
    
    <!-- META DATA -->
    <input type="hidden" name="has_checks" value="off"/>
    <input type="hidden" name="takes_deposits" value="off"/>
    <input type="hidden" name="accounts_receivable_account" value="on"/>
    <input type="hidden" name="cash_account" value="off"/>
    <!-- Follow a similar pattern as company options -->
    <xsl:for-each select="//account_meta/meta/meta_key[@category='address']">
        <xsl:variable name="my_option"><xsl:value-of select="."/></xsl:variable>
        <tr>
            <td><xsl:value-of select="//label[key=$my_option]/value"/>: </td>
            <td><input type="text" name="{$my_option}" value="{//account_meta_get[meta_key=$my_option]/meta_value}"/></td>
        </tr>
    </xsl:for-each>
    <!-- END META -->
	<tr>
		<td valign="top"><xsl:value-of select="//label[key='account_number']/value"/>:</td>
		<td><input type="text" name="account_number"  required="1" err="{//error[key='missing_account_number']/value}" value="{//get_account/account_number|//_post/account_number}"/></td>
	</tr>
	<tr>
		<td valign="top"><xsl:value-of select="//label[key='desc']/value"/>:</td>
		<td><textarea name="description" cols="40" rows="6"><xsl:value-of select="//get_account/description|//_post/description"/>&#160;</textarea></td>
	</tr>
    <tr>
		<td valign="top"><xsl:value-of select="//label[key='group']/value"/>:</td>	
        <td>
        <select name="group_id">
        <xsl:for-each select="//get_account_groups">
            <xsl:variable name="my_group_id"><xsl:value-of select="id"/></xsl:variable>
            <option value="{id}">
                <xsl:if test="//get_account/group_id=id">
                    <xsl:attribute name="selected">selected</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="name"/>
            </option>
        </xsl:for-each>
        </select>
        </td>
	</tr>
    <tr>
		<td valign="top"><xsl:value-of select="//label[key='hide']/value"/>:</td>
		<td>
            <input type="checkbox" name="hide">
                <xsl:if test="//get_account/hide='on'">
                    <xsl:attribute name="checked">checked</xsl:attribute>
                </xsl:if>
            </input>
        </td>
	</tr>
</table>
<div style="text-align: center; margin-top: 20px;">
    <input type="submit" value="Save" name="submit" />
    <input type="button" value="Cancel"
        onclick="window.location.href='{/__ROOT__/runtime/link_prefix}customer-accounts'"/>
</div>
</form>
</xsl:template>
</xsl:stylesheet>