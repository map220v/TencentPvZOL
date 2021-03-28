package asgui.blit.bone.rules
{
   import flash.events.Event;
   
   public class BlitBoneVisibleRule extends BlitBoneRule
   {
       
      
      private var boneVisibleRule:Array;
      
      private var boneVisibleRuleCompare:Vector.<Array>;
      
      private var boneVisibleRuleCompareDict:Array;
      
      private var _ruleCurrentString:String;
      
      public function BlitBoneVisibleRule()
      {
         this.boneVisibleRule = [];
         this.boneVisibleRuleCompare = new Vector.<Array>();
         this.boneVisibleRuleCompareDict = [];
         super();
      }
      
      public function clearAllBoneVisibleRules() : void
      {
         this.boneVisibleRule = [];
         this.boneVisibleRuleCompare = new Vector.<Array>();
         this.boneVisibleRuleCompareDict = [];
         _hasSettedRule = false;
         this.dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function setBoneVisibleRule(param1:String, param2:Boolean) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc3_:Boolean = false;
         if(!param2)
         {
            _hasSettedRule = true;
         }
         if(param1.indexOf("/") != -1)
         {
            _loc5_ = param1.split("/");
            param1 = _loc5_[_loc5_.length - 1];
         }
         if(param1.indexOf("*") == -1)
         {
            if(!param2)
            {
               if(this.boneVisibleRule[param1] != param2)
               {
                  this.boneVisibleRule[param1] = param2;
                  _loc3_ = true;
               }
            }
            else if(this.boneVisibleRule[param1] != null)
            {
               delete this.boneVisibleRule[param1];
               _loc3_ = true;
            }
         }
         else
         {
            if(!param2)
            {
               this.boneVisibleRuleCompare.push([param2,param1.split("*"),param1]);
            }
            else
            {
               _loc6_ = this.boneVisibleRuleCompare.length;
               while(_loc4_ < _loc6_)
               {
                  if((_loc5_ = this.boneVisibleRuleCompare[_loc4_])[2] == param1)
                  {
                     this.boneVisibleRuleCompare.splice(_loc4_,1);
                     break;
                  }
                  _loc4_++;
               }
            }
            this.boneVisibleRuleCompareDict = [];
            _loc3_ = true;
         }
         this._ruleCurrentString = null;
         if(_loc3_)
         {
            this.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function getBoneVisibleRule(param1:String) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:Array = null;
         var _loc6_:String = null;
         if(this.boneVisibleRule[param1] != null)
         {
            return !!this.boneVisibleRule[param1] ? 1 : 0;
         }
         if(this.boneVisibleRuleCompareDict[param1] != null)
         {
            return this.boneVisibleRuleCompareDict[param1];
         }
         _loc3_ = this.boneVisibleRuleCompare.length;
         _loc2_ = 0;
         for(; _loc2_ < _loc3_; _loc2_++)
         {
            _loc4_ = this.boneVisibleRuleCompare[_loc2_][0];
            if((_loc5_ = this.boneVisibleRuleCompare[_loc2_][1]).length == 2 && _loc5_[0].length > 0)
            {
               _loc6_ = _loc5_[0];
               if(param1.indexOf(_loc6_) == 0)
               {
                  this.boneVisibleRuleCompareDict[param1] = !!_loc4_ ? 1 : 0;
                  continue;
               }
            }
            if(_loc5_.length == 2 && _loc5_[1].length > 0)
            {
               _loc6_ = _loc5_[1];
               if(param1.indexOf(_loc6_) == param1.length - _loc6_.length)
               {
                  this.boneVisibleRuleCompareDict[param1] = !!_loc4_ ? 1 : 0;
               }
            }
         }
         if(this.boneVisibleRuleCompareDict[param1] == null)
         {
            this.boneVisibleRuleCompareDict[param1] = -1;
         }
         return this.boneVisibleRuleCompareDict[param1];
      }
      
      override public function getRuleCurrentString() : String
      {
         var names:Vector.<String> = null;
         var name:String = null;
         var i:int = 0;
         var length:int = 0;
         if(this._ruleCurrentString == null)
         {
            names = new Vector.<String>();
            for(name in this.boneVisibleRule)
            {
               names.push(name);
            }
            length = this.boneVisibleRuleCompare.length;
            i = 0;
            while(i < length)
            {
               name = this.boneVisibleRuleCompare[i][2];
               names.push(name);
               i++;
            }
            names.sort(function(param1:String, param2:String):int
            {
               return param1 > param2 ? 1 : -1;
            });
            this._ruleCurrentString = names.toString();
         }
         return this._ruleCurrentString;
      }
   }
}
