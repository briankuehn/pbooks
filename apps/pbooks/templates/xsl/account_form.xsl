<!--
Program: PBooks
Component: account_form.xsl
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
<form method="post" action="{//request_uri}" onSubmit="return validateStandard(this, 'myerror');">

<!-- Check if the user is creating a new account or editing and existing one, 
and set appropriate parameter "my_action" -->
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

<table class="form-table" cellpadding="10">
	<tr>
		<td>
            <xsl:value-of select="//label[key='account_name']/value"/>:
        </td>
		<td>
            <input type="text" name="name" value="{//get_account/name|//_post/name}"  
            required="1" err="{//error[key='missing_account_name']/value}"/>
        </td>
	</tr>
	<tr>
		<td>
            <xsl:value-of select="//label[key='account_type']/value"/>:
        </td>
		<td>
            <select name="account_type_id">
				<option><xsl:value-of select="//label[key='select_one']/value"/></option>
				<xsl:for-each select="//account_types/account_type">
					<option value="{account_type_id}"><xsl:if test="//get_account/account_type_id=account_type_id or //_post/account_type_id=account_type_id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="name"/></option>
				</xsl:for-each>
			</select>
		</td>
	</tr>
	<tr>
		<td><xsl:value-of select="//label[key='account_number']/value"/>:</td>
		<td><input type="text" name="account_number"  required="1" err="{//error[key='missing_account_number']/value}" value="{//get_account/account_number|//_post/account_number}"/></td>
	</tr>
	<tr>
		<td>
            <xsl:value-of select="//label[key='desc']/value"/>:
        </td>
		<td>
            <textarea name="description" cols="40" rows="6">
                <xsl:value-of select="//get_account/description|//_post/description"/>&#160;
            </textarea>
        </td>
	</tr>
	<tr>
		<td>
            <xsl:value-of select="/__ROOT__/i18n/labels/label[key='has_checks']/value"/>:
        </td>
		<td>
            <input type="radio" name="has_checks" value="on">
                <xsl:if test="/__ROOT__/account_meta_get[meta_key='has_checks']/meta_value='on'">
                    <xsl:attribute name="checked">checked</xsl:attribute>
                </xsl:if>
            </input>Yes<br/>
            <input type="radio" name="has_checks" value="off">
                <xsl:if test="not(/__ROOT__/account_meta_get[meta_key='has_checks']/meta_value='on')">
                    <xsl:attribute name="checked">checked</xsl:attribute>
                </xsl:if>
            </input>No
        </td>
	</tr>
	<tr>
		<td>
            <xsl:value-of select="//label[key='takes_deposits']/value"/>:
        </td>
		<td>
            <input type="radio" name="takes_deposits" value="on">
                <xsl:if test="/__ROOT__/get_account/takes_deposits='on'">
                    <xsl:attribute name="checked">checked</xsl:attribute>
                </xsl:if>
            </input>Yes<br/>
            <input type="radio" name="takes_deposits" value="off">
                <xsl:if test="not(/__ROOT__/get_account/takes_deposits='on')">
                    <xsl:attribute name="checked">checked</xsl:attribute>
                </xsl:if>
            </input>No
        </td>
	</tr>
	<tr>
		<td>
            <xsl:value-of select="//label[key='accounts_receivable_account']/value"/>:
        </td>
		<td>
            <input type="radio" name="accounts_receivable_account" value="on">
                <xsl:if test="/__ROOT__/account_meta_get[meta_key='accounts_receivable_account']/meta_value='on'">
                    <xsl:attribute name="checked">checked</xsl:attribute>
                </xsl:if>
            </input>Yes<br/>
            <input type="radio" name="accounts_receivable_account" value="off">
                <xsl:if test="not(/__ROOT__/account_meta_get[meta_key='accounts_receivable_account']/meta_value='on')">
                    <xsl:attribute name="checked">checked</xsl:attribute>
                </xsl:if>
            </input>No<br/>
        </td>
	</tr>
	<tr>
		<td>
            <xsl:value-of select="/__ROOT__/i18n/labels/label[key='cash_account']/value"/>:</td>
		<td>
            <input type="radio" name="cash_account" value="on">
                <xsl:if test="//get_account/cash_account='on'">
                    <xsl:attribute name="checked">checked</xsl:attribute>
                </xsl:if>
            </input>Yes
            <br/>
            <input type="radio" name="cash_account" value="off">
                <xsl:if test="not(//get_account/cash_account='on')">
                    <xsl:attribute name="checked">checked</xsl:attribute>
                </xsl:if>
            </input>No
        </td>
	</tr>
    <tr>
		<td>
            <xsl:value-of select="//label[key='group']/value"/>:
        </td>
        <td>
            <select name="group_id">
            <xsl:for-each select="//get_account_groups">
                <xsl:variable name="my_group_id"><xsl:value-of select="id"/></xsl:variable>
                <option value="{id}"><xsl:if test="//get_account/group_id=id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="name"/></option>
            </xsl:for-each>
            </select>
        </td>
	</tr>
    <tr>
		<td>
            <xsl:value-of select="//label[key='hide']/value"/>:
        </td>
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
    <input type="submit" value="{//label[key='save']/value}" name="submit" />
    <input type="button" value="{//label[key='cancel']/value}" 
    onclick="window.location.href='{/__ROOT__/runtime/link_prefix}accounts'"/>
</div>
</form>				
</xsl:template>
</xsl:stylesheet>