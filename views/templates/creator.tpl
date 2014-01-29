<link rel="stylesheet" href="<?= BASE_WWW ?>css/creator.css" />

<div id="test-creator">
    
    <div class="nav">
        
        <h1 data-bind="title"></h1><h2>&nbsp;&gt;&nbsp;<?=__('Author Content')?></h2>
        
        <div class="actions right">
             <button id='saver' class="big"><?=__('Save')?></button>
        </div>
    </div>
    
    <div id="test-properties" class='card'>
        <h1><?=__('Test Properties')?></h1>
        <div class='content'>
            
            <div class='help'>
                <a href="#" class='closed' data-toggle='+ span'>?</a>
                <span><?=__('Fill the properties of the test.')?></span>
            </div>
            
            <form>
               
                <div class='form-group'>
                    <label ><?=__('Submission')?></label>

                    <div >
                        <input type="radio" id="submission-mode-individual" name="submission-mode" value="0" data-bind="testParts.0.submissionMode" data-bind-encoder="number" checked="checked" />
                        <label for="submission-mode-individual"><?=__('Individual')?></label>
                        <span class='form-info'>(<?=__('Item one by one')?>)</span>
                        <br />
                        <input type="radio" id="submission-mode-simultaneous" name="submission-mode" value="1"  />
                        <label for="submission-mode-simultaneous"><?=__('Simultaneous')?></label>
                        <span class='form-info'>(<?=__('All items at once')?>)</span>
                    </div>
                </div>

                 <hr />

                <div  class='form-group'>
                    <label for="navigation-mode" ><?=__('Navigation')?></label>
                    <div>
                        <input type="radio" id="navigation-mode-linear" name="navigation-mode" value="0"  data-bind="testParts.0.navigationMode" data-bind-encoder="number"  checked="checked"  />
                        <label for="navigation-mode-linear"><?=__('Linear')?></label>
                        <br />
                        <input type="radio" id="navigation-mode-nonlinear" name="navigation-mode" value="1" data-disable='#min-time' />
                        <label for="navigation-mode-nonlinear"><?=__('Non Linear')?></label>
                        <span class='form-info'>(<?=__('Navigation between items allowed')?>)</span>
                    </div>
                </div>

                <hr />

                <div id="min-time" class='form-group'>
                    <label><?=__('Min Duration')?></label>
                    <input type="text" name="min-time" value="00:00:00" data-duration="HH:mm:ss" data-bind="testParts.0.timeLimits.minTime" data-bind-encoder="time" />
                </div>

                <div class='form-group'>
                    <label><?=__('Max Duration')?></label>
                    <input type="text" name="max-time" value="00:00:00" data-duration="HH:mm:ss" data-bind="testParts.0.timeLimits.maxTime" data-bind-encoder="time" />
                </div>

                <div class='form-group'>
                    <input type="checkbox" id="allow-late-submission" name="allow-late-submission" value="true" data-bind="testParts.0.timeLimits.allowLateSubmission" data-bind-encoder="boolean" />
                    <label for="allow-late-submission" class='after'><?=__('Late submission allowed')?></label>
                </div>
                
                 <hr />
                 
                 <div class='form-group'>
                    <label><?=__('Max Attempts')?></label>
                    <input type="text" id="maxAttempts" class="micro"  name="maxAttempts" data-increment="1" data-min="0" value="1" data-bind="testParts.0.itemSessionControl.maxAttempts" data-bind-encoder="number" />
                     <span class='form-info'>(<?=__('0 means unlimited')?>)</span>
                 </div>
                 
                 <div class='form-group'>
                    <input type="checkbox" id="allow-comments" name="allow-comments" value="true" data-bind="testParts.0.itemSessionControl.allowComment" data-bind-encoder="boolean" />
                    <label for="allow-late-submission" class='after'><?=__('Allow comments')?></label>
                 </div>
                 
                 <div class='form-group'>
                    <input type="checkbox" id="allow-skipping" name="allow-skipping" value="true" data-bind="testParts.0.itemSessionControl.allowSkipping" data-bind-encoder="boolean" checked="checked" />
                    <label for="allow-late-submission" class='after'><?=__('Allow skipping')?></label>
                 </div>
            
            </form>
            
        </div>
    </div>
    
    <div id="items" class='card'>
        <h1><?=__("QTI Items")?></h1>
        <div class='content'>
            
            <div class='help'>
                <a href="#" class='closed' data-toggle='+ span'>?</a>
                <span><?=__('Move items to sections (using drag &amp; drop)')?></span>
            </div>
            
            
            <input type="text" class='search' /><span class='ctrl' />
            
           <div>
                <ul class='listbox'></ul>
            </div>
        </div>
    </div>
    
    <div id="test-sections"  class='card'>
        <h1><?=__("Test's Sections")?></h1>
        <div class='content'>
            
            <div class='help'>
                <a href="#" class='closed' data-toggle='+ span'>?</a>
                <span><?=__('Drop items to a section, and manage them to build your test.')?></span>
            </div>
            
            <div id="sections" data-bind-each="testParts.0.assessmentSections"  data-bind-tmpl="#section-template" ></div>
            <a href="#" id="section-adder" class='adder'><?=__('Add a new section')?></a>
       </div>
    </div>
</div>
                
<script id="item-template" type="text/template">
{{#each .}}
     <li data-uri='{{uri}}'>
        {{label}} 
        {{#if parent}}<span class='label'>{{parent}}</span>{{/if}}
     </li>
{{/each}}
</script>

<script id="section-template" type="text/template">
    <div id="section-wrapper-{{identifier}}">
        <div class="section flip flip-front" id='{{identifier}}'>

           <h2 data-in-place='#{{identifier}}title' data-width='50%' data-bind="title">{{title}}</h2>

           <a href="#" class='sort' title="<?=__('Sort sections')?>"></a>
           <a href="#" class='closer' data-close='#section-wrapper-{{identifier}}' title="<?=__('Remove section')?>"></a>

           <a href="#" class='show-rubricblock' data-flip=':parent' data-flip-back='#{{identifier}}-back' data-unflip='#{{identifier}}-back .hide-rubricblock'><?=__('Rubric block')?></a>

           <a href="#" class='closed option-toggler' data-toggle='+ .section-options'><?=__('Section properties')?></a>
           <div class='section-options toggled'>
               <form>
                   <div  class='form-group'>
                       <label ><?=__('Visibility')?></label>
                       <div>
                           <input type="checkbox" name='{{identifier}}-visible' value='true' checked="checked" data-bind="visible" data-bind-encoder="boolean" />
                           <label for="visible"><?=__('Section is identifiable by test takers')?></label>
                       </div>
                   </div>
                   <div  class='form-group'>
                       <label ><?=__('Items selection')?></label>
                       <div>
                           <input type="radio" id="{{identifier}}-selection-all"  name="{{identifier}}-selection" value="true" data-bind-rm="selection" data-bind-encoder="boolean" checked="checked"  />
                           <label for="selection-all"><?=__('Display all items')?></label>
                           <br />
                           <input type="radio" id="{{identifier}}-selection-rand" name="{{identifier}}-selection" data-toggle=".randomized" value="false" />
                           <label for="selection-rand"><?=__('Select items randomly')?></label>
                           <div class='form-group randomized toggled'>
                               <label for="select" ><?=__('Number of items to be displayed')?></label>
                               <input type="text" id="{{identifier}}-select" class="micro"  name="{{identifier}}-select" data-increment="1" data-min="1" data-bind="selection.select" data-bind-encoder="number" />
                           </div>
                           <div class='form-group randomized toggled'>
                               <input type="checkbox" id="{{identifier}}-with-replacement" name="{{identifier}}-with-replacement" value="true" data-bind="selection.withReplacement" data-bind-encoder="boolean" />
                               <label for="with-replacement" class='after'><?=__('Allow multiple selection for an item')?></label>
                           </div>
                       </div>
                   </div>
                   <div id="{{identifier}}-ordering" class='form-group'>
                       <label ><?=__('Order')?></label>
                       <div>
                           <input type="checkbox" id="{{identifier}}-shuffle" name="{{identifier}}-shuffle" value="true" data-bind="ordering.shuffle" data-bind-encoder="boolean" />
                           <label for="shuffle"><?=__('Shuffle')?></label>
                       </div>
                   </div>
               </form>
           </div>

           <ul class="listbox" data-bind-each="sectionParts" data-bind-tmpl="#item-ref-template"></ul>

       </div>
       <div class="section-back flip flip-back" id='{{identifier}}-back'>
            <div  class='form-group'>
               <label ><?=__('RubricBlock view')?></label>
               <div>
                    <select name="view" multiple="multiple" data-bind="rubricBlocks.0.views">
                        <option value="author"><?=__('Author')?></option>
                        <option selected="selected" value="candidate"><?=__('Candidate')?></option>
                        <option value="proctor"><?=__('Proctor')?></option>
                        <option value="scorer"><?=__('Scorer')?></option>
                        <option value="testConstructor"><?=__('Test constructor')?></option>
                        <option value="tutor"><?=__('Tutor')?></option>
                    </select>
                </div>
            </div>
           <textarea data-bind="rubricBlocks.0.content" data-bind-encoder="dom2qti"></textarea>
           <br />
           <button class='hide-rubricblock' ><?=__('Done')?></button>
       </div>
    </div>
</script>

<script id="item-ref-template" type="text/template">
    <li id='{{identifier}}' data-uri='{{href}}' class='item-ref'>
        <span class='label small' data-in-place='#{{identifier}}-order' data-width='10px'>{{index}}</span>
        <span class='title'>{{label}}</span>
        <div class='button-group toggled' data-button-group='toggle' data-bind='fixed' data-bind-encoder='boolean'>
           <a href='#' class='icon shuffle active' data-bind-value='false'></a>
           <a href='#' class='icon fix' data-bind-value='true'></a>
       </div>
       <a href="#" class='closer' data-close=':parent' title="<?=__('Remove item from section')?>"></a>
    </li>
</script>

<script id="section-ref-template" type="text/template">
    <li id='{{identifier}}' class='section-ref'>
        <span class='label small' data-in-place='#{{identifier}}-order' data-width='10px'>{{index}}</span>
        <span class='title'>&#8599; {{title}}</span>
        <a href="#" class='closer' data-close=':parent' title=""></a>
    </li>
</script>

<script type="text/javascript">
requirejs.config({
    config: {
        'taoQtiTest/controller/creator/creator' : {
            routes : {
                get  : '<?=get_data('loadUrl')?>',
                save  : '<?=get_data('saveUrl')?>',
                items : '<?=get_data('itemsUrl')?>',
                identifier : '<?=get_data('identifierUrl')?>'
            },
            labels : <?=get_data('labels')?>
       }
    }
});
</script>
