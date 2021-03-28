package com.qq.modules.guide.model.vo
{
   public class GuideDialogueVO
   {
       
      
      public var title:String;
      
      public var sentences:Vector.<GuideSentenceVO>;
      
      public var nextName:String = "t1";
      
      public function GuideDialogueVO(param1:Object, param2:String = null)
      {
         var _loc3_:Object = null;
         super();
         if(param2 != null)
         {
            this.nextName = param2;
         }
         this.sentences = new Vector.<GuideSentenceVO>();
         this.title = param1.title;
         for each(_loc3_ in param1)
         {
            if(!(_loc3_ is String))
            {
               this.sentences.push(new GuideSentenceVO(_loc3_));
            }
         }
      }
      
      public function getSentence(param1:String) : GuideSentenceVO
      {
         var _loc2_:int = 0;
         var _loc3_:int = this.sentences.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.sentences[_loc2_].name == param1)
            {
               this.nextName = this.sentences[_loc2_].next;
               return this.sentences[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getNextSentence() : GuideSentenceVO
      {
         if(this.nextName == null)
         {
            return null;
         }
         return this.getSentence(this.nextName);
      }
   }
}
