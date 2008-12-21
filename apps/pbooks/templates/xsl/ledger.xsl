<!--
Program: PBooks
Component: ledger.xsl
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
or write to the Free Software Foundation, Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="main.xsl"/>
	<xsl:include href="date_select.xsl"/>
	<xsl:include href="pager.xsl"/>
	<xsl:template name="content">
		<xsl:param name="link_prefix"/>
		<xsl:param name="path_prefix"/>
		<xsl:param name="i18n"/>
		<xsl:variable name="get_equation"
			select="/_R_/get_equation/get_equation"/>
		<xsl:variable name="get_transactions"
			select="/_R_/get_all_transactions/get_all_transactions"/>

		<xsl:if test="not(/_R_/_get/nid='matching')">
			<xsl:call-template name="jquery-setup">
				<xsl:with-param name="my-table">myLedger</xsl:with-param>
				<xsl:with-param name="my-table-div">myLedgerDiv</xsl:with-param>
				<xsl:with-param name="my-sort-column">
					,widthFixed: true
					<xsl:if test="/_R_/_get/account_id">,sortList: [[0,0]]</xsl:if>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="/_R_/_get/nid='matching'">
			<xsl:call-template name="jquery-setup"/>
		</xsl:if>
    <!-- Need this action to retain any account selection -->
		<form method="get">
			<input type="hidden" name="nid" value="{/_R_/_get/nid}"/>
			<xsl:if test="/_R_/_get/account_id">
				<input type="hidden" name="account_id" value="{/_R_/_get/account_id}"/>
			</xsl:if>
			<table>
				<tr>
					<td>
						<xsl:value-of select="$i18n/month"/>:
          </td>
					<td>
						<select name="month" onchange="this.form.submit();">
							<option value="%">All</option>
							<xsl:for-each select="//months/option">
								<option value="{@id}">
									<xsl:if test="@id=/_R_/_get/month">
										<xsl:attribute name="selected">selected</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="@fullname"/>
								</option>
							</xsl:for-each>
						</select>
					</td>
				</tr>
			</table>
		</form>
		<form method="get">
			<xsl:if test="/_R_/_get/account_id">
				<input type="hidden" name="account_id" value="{/_R_/_get/account_id}"/>
			</xsl:if>
			<input type="hidden" name="nid" value="{/_R_/_get/nid}"/>
			<xsl:call-template name="date_select"/>
			<input type="submit"/>
		</form>
		<table>
			<form method="get">
				<tr>
					<input type="hidden" name="nid" value="{/_R_/_get/nid}"/>
					<td>
						<xsl:value-of select="$i18n/select_one"/>:
          </td>
					<td align="right">
						<select name="account_id" onchange="this.form.submit();">
							<option value="%">
								<xsl:value-of select="$i18n/ledger"/>
							</option>

							<xsl:for-each select="/_R_/get_all_accounts/get_all_accounts">
								<option value="{id}">
									<xsl:if test="id=/_R_/_get/account_id">
										<xsl:attribute name="selected">selected</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="name"/>
								</option>
							</xsl:for-each>
						</select>
					</td>
					<td></td>
				</tr>
			</form>
		</table>
		<div style="min-height: {//ledger_table/height};" id="myLedgerDiv">
			<xsl:if test="not(/_R_/_get/nid='matching')">
			<script type="text/javascript">
      document.getElementById('myLedgerDiv').style.visibility = 'hidden';
      </script>
			</xsl:if>
			<table id="myLedger" class="tablesorter">
				<thead>
					<tr>
						<!-- This cell will be used for a star or flag with notations -->
						<!--<th>FPO</th>-->
						<th>
							<xsl:value-of select="$i18n/date"/>:
						</th>
						<th>
							<xsl:value-of select="$i18n/post"/>
						</th>
						<th>
							<xsl:value-of select="$i18n/memo"/>
						</th>

            <!-- Exclude account column if only one account selected-->
						<xsl:if test="(/_R_/_get/account_id='%' or not(/_R_/_get/account_id))">
							<th>
								<xsl:value-of select="$i18n/account"/>
							</th>
						</xsl:if>

						<th>
							<xsl:value-of select="$i18n/amount"/>
						</th>

						<xsl:if test="not(/_R_/_get/account_id='%') and /_R_/_get/account_id">
							<th>Balance</th>
						</xsl:if>
					</tr>
				</thead>


        <!-- General ledger -->
				<tbody>
					<xsl:for-each select="$get_transactions">
						<xsl:if test="((not(//_get/account_id) or /_R_/_get/account_id='%')  and not(entry_amount=0.00)) or (not(/_R_/_get/account_id='%') and /_R_/_get/account_id)">
						<tr onmouseover="oldClass=this.className; this.className='active'"
							onmouseout="this.className=oldClass">
              <!-- This cell will be used for a star or flag with notations -->
              <!--<td>FPO</td>-->
							<td>
								<xsl:choose>
									<xsl:when test="entry_id &gt; 0">
										<a href="{$link_prefix}journal&amp;from_date={entry_datetime}">
											<xsl:value-of select="entry_datetime"/>
										</a>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="entry_datetime"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td>
								<xsl:choose>
									<xsl:when test="entry_id &gt; 1">
										<a href="{$link_prefix}journal-entry&amp;entry_id={entry_id}">
											<xsl:value-of select="entry_id"/>
										</a>
									</xsl:when>
									<xsl:when test="entry_id = 0">
										<a href="{$link_prefix}ledger-delete&amp;transaction_id={transaction_id}"
											onclick="return confirm('Are you sure you want to delete this ledger transaction?')">
											<img src="{$path_prefix}{/_R_/runtime/icon_set}delete.png" alt="x"/>
										</a>
                    &#160;
                    <!-- create new matching entry -->
										<a href="{$link_prefix}journal-new-from-transaction&amp;transaction_id={transaction_id}">
											<img src="{$path_prefix}{/_R_/runtime/icon_set}add.png" alt="+"/>
										</a>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
							</td>

							<td nowrap="nowrap">
								<xsl:choose>
									<xsl:when test="entry_id &gt; 0">
										<a href="{$link_prefix}journal-entry&amp;entry_id={entry_id}">
											<xsl:value-of select="substring(memorandum,0,42)"/>
										</a>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="substring(memorandum,0,42)"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>

							<xsl:if test="/_R_/_get/account_id='%' or not(/_R_/_get/account_id)">
								<td nowrap="nowrap">
									<a href="{$link_prefix}ledger&amp;account_id={account_id}">
										<xsl:value-of select="substring(name,0,20)"/>
									</a>
								</td>
							</xsl:if>

							<td>
								<xsl:choose>
									<xsl:when test="entry_id &gt; 0">
										<xsl:value-of select="entry_amount"/>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
							</td>

							<xsl:if test="not(/_R_/_get/account_id='%') and /_R_/_get/account_id">
								<td>
									<xsl:value-of select="balance"/>
								</td>
							</xsl:if>
						</tr>
						</xsl:if>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
		<xsl:if test="not(/_R_/_get/nid='matching')">
			<div class="generic-box" style="font-size: 12px; float: right;">
				<a href="{$link_prefix}ledger-export&amp;account_id={//_get/account_id}">
					Export to CSV
				</a>
			</div>
			<xsl:call-template name="pager">
				<xsl:with-param name="my-table">myLedger</xsl:with-param>
			</xsl:call-template>
		</xsl:if>

		<!-- If an account_id has been selected, only show how much it has changed.-->
		<xsl:if test="(/_R_/_get/account_id &gt; 0)">
		<!-- Net change -->
			<div class="generic-box" style="font-size: 18px;">
				Net change:
				<xsl:value-of select="sum($get_transactions/entry_amount)"/>
			</div>
			<br/>

			<!--
				Provide some links to related pages: gl and account edit
			-->
			<xsl:value-of select="$i18n/account_ledger_links"/>
			<a href="{$link_prefix}ledger">
				<xsl:value-of select="$i18n/general_ledger"/>
			</a>
			<a href="{$link_prefix}accounts-edit&amp;account_id={/_R_/_get/account_id}">
				<xsl:value-of select="$i18n/account_edit"/>
			</a>
		</xsl:if>

		<!--
			Show the accounting equation in no specific account is selected
		-->
		<xsl:if test="(/_R_/_get/account_id='%' or not(/_R_/_get/account_id)) and not(contains(/_R_/_get/nid,'match') )">
			<table class="tablesorter">
				<thead>
					<tr>
						<th>
							<xsl:value-of select="$i18n/assets"/> +
            </th>
						<th>
							<xsl:value-of select="$i18n/expenses"/> =
            </th>
						<th>
							<xsl:value-of select="$i18n/sub_total"/> =
            </th>
						<th>
							<xsl:value-of select="$i18n/liabilities"/> +
            </th>
						<th>
							<xsl:value-of select="$i18n/equity"/> +
            </th>
						<th>
							<xsl:value-of select="$i18n/revenue"/> = 
            </th>
						<th>
							<xsl:value-of select="$i18n/total"/>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<xsl:value-of select="$get_equation/asset_total"/> +
            </td>
						<td>
							<xsl:value-of select="$get_equation/expenses_total"/> =
            </td>
						<td>
							<xsl:if test="$get_equation/asset_total + $get_equation/expenses_total">
								<xsl:value-of select="$get_equation/asset_total + $get_equation/expenses_total"/>
							</xsl:if>
						</td>
						<td>
							<xsl:value-of select="$get_equation/liabilities_total"/> +
            </td>
						<td>
							<xsl:value-of select="$get_equation/equity_total"/> +
            </td>
						<td>
							<xsl:value-of select="$get_equation/revenue_total"/>
						</td>
						<td>
							<xsl:if test="$get_equation/liabilities_total + $get_equation/equity_total + $get_equation/revenue_total">
								<xsl:value-of select="$get_equation/liabilities_total + $get_equation/equity_total + $get_equation/revenue_total"/>
							</xsl:if>
						</td>
					</tr>
				</tbody>
			</table>
		</xsl:if>
		<br/>
	</xsl:template>
</xsl:stylesheet>
