/**
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; under version 2
 * of the License (non-upgradable).
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 *
 * Copyright (c) 2015 (original work) Open Assessment Technologies SA ;
 */

/**
 * Test Runner Navigation Plugin : Next Section
 *
 * @author Bertrand Chevrier <bertrand@taotesting.com>
 */
define([
    'jquery',
    'i18n',
    'taoTests/runner/plugin',
    'tpl!taoQtiTest/runner/plugins/navigation/button'
], function ($, __, pluginFactory, buttonTpl){
    'use strict';

    return pluginFactory({
        name : 'nextsection',
        init : function init(){
            var self = this;
            var testRunner = this.getTestRunner();

            this.$element = $(buttonTpl({
                control : 'next-section',
                title   : __('Skip to the next section'),
                icon    : 'fast-forward',
                text    : __('Next Section')
            }));

            this.$element.on('click', function(e){
                e.preventDefault();

                testRunner.next('section');
            });
        },
        render : function render(){
            var $container = this.getAreaBroker().getNavigationArea();
            $container.append(this.$element);
        },
        destroy : function destroy (){
            this.$element.remove();
        },
        enable : function enable (){
            this.$element.removeProp('disabled');
        },
        disable : function disable (){
            this.$element.prop('disabled', true);
        },
        show: function show(){
            this.element.show();
        },
        hide: function hide(){
            this.element.hide();
        },
    });
});
