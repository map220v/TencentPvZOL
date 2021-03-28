package com.qq.modules.guide.model.vo
{
   import com.qq.modules.guidePlus.model.templates.GuideTemplateFactory;
   import com.qq.modules.guidePlus.model.templates.ce.GuideTextTemplateCE;
   
   public class GuideSentenceVO
   {
       
      
      private var act:Function;
      
      private var actHasDid:Boolean = false;
      
      public var actor:int;
      
      public var talk:String;
      
      public var next:String;
      
      public var name:String;
      
      public var move:String;
      
      public var passable:Boolean = true;
      
      public var hasNpc:Boolean;
      
      public var nextEventTarget:String;
      
      public var nextEventType:String;
      
      public var saveStep:Boolean;
      
      public var killGuide:Boolean;
      
      public var noDisposeToScene:String;
      
      public function GuideSentenceVO(param1:Object)
      {
         var _loc2_:int = 0;
         var _loc3_:GuideTextTemplateCE = null;
         var _loc4_:String = null;
         super();
         this.name = param1.name;
         this.act = param1.act;
         this.actor = param1.actor;
         if(param1.hasOwnProperty("talk"))
         {
            if(param1.talk is String)
            {
               this.talk = param1.talk;
            }
            else
            {
               _loc2_ = int(param1.talk);
               _loc3_ = GuideTemplateFactory.instance.getTextTemplate(_loc2_);
               _loc4_ = !!_loc3_ ? _loc3_.text : "dialogue: " + _loc2_;
               while(_loc4_.indexOf("\\n") != -1)
               {
                  _loc4_ = _loc4_.replace("\\n","\n");
               }
               this.talk = _loc4_;
            }
         }
         if(param1.hasOwnProperty("passable"))
         {
            this.passable = Boolean(param1.passable);
         }
         this.next = param1.next;
         this.move = param1.move;
         this.saveStep = Boolean(param1.saveStep);
         this.killGuide = Boolean(param1.killGuide);
         this.noDisposeToScene = param1.noDisposeToScene;
         this.hasNpc = this.actor != 0;
         if(param1.nextEvent)
         {
            this.nextEventTarget = param1.nextEvent.target;
            this.nextEventType = param1.nextEvent.type;
         }
      }
      
      public function tryDoAct() : void
      {
         if(this.act != null)
         {
            this.act.apply();
            this.actHasDid = true;
         }
      }
   }
}
