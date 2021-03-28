package asgui.blit.bone.rules
{
   import asgui.blit.Blit;
   import asgui.blit.bone.BlitBone;
   import asgui.blit.bone.BlitBoneData;
   import asgui.blit.bone.BlitBoneDisplayHolder;
   import asgui.blit.bone.BlitBoneFrameBatch;
   import asgui.blit.bone.BlitBoneFrameChild;
   import asgui.blit.bone.BlitBoneManager;
   import asgui.blit.bone.decode.BlitBoneDataPluginDebug;
   import asgui.blit.data.BlitData;
   import asgui.blit.data.BlitFrameData;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.logger.AsguiLogger;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.utils.ByteArray;
   import flash.utils.getQualifiedClassName;
   
   public class BlitBoneDataOuterBindRule extends BlitBoneRule
   {
      
      public static const TAG_ROOT_NAME:int = 1;
      
      public static const TAG_NODE_NAME:int = 2;
      
      public static const TAG_BLIT_DATA:int = 3;
      
      public static const TAG_CHILD:int = 4;
       
      
      private var _autoMergeTexture:Boolean = false;
      
      private var rules:Array;
      
      private var checkedNodes:Array;
      
      private var _blitBoneData:BlitBoneData;
      
      private var rulePreFixes:Vector.<String>;
      
      private var rulePostFixes:Vector.<String>;
      
      private var checkedBlitBoneFrameChildren:Vector.<String>;
      
      private var readedRules:Array;
      
      public var readedRootNameForBlitBoneData:String;
      
      public var readedNodeNameForBlitBoneData:String;
      
      private var readedChildForBlitBoneData:BlitBoneFrameChild;
      
      private var readedRootName:Vector.<String>;
      
      private var readedNodeName:Vector.<String>;
      
      private var readedChild:Vector.<BlitBoneFrameChild>;
      
      private var _scaleRate:Number = 1;
      
      private var _ruleCurrentString:String = "";
      
      public function BlitBoneDataOuterBindRule()
      {
         this.rules = [];
         this.checkedNodes = [];
         this.rulePreFixes = new Vector.<String>();
         this.rulePostFixes = new Vector.<String>();
         this.readedRules = [];
         this.readedRootName = new Vector.<String>();
         this.readedNodeName = new Vector.<String>();
         this.readedChild = new Vector.<BlitBoneFrameChild>();
         super();
      }
      
      public function get autoMergeTexture() : Boolean
      {
         return this._autoMergeTexture;
      }
      
      public function set autoMergeTexture(param1:Boolean) : void
      {
         if(this._autoMergeTexture != param1)
         {
            this._autoMergeTexture = param1;
         }
      }
      
      override public function Dispose() : void
      {
         if(this._blitBoneData)
         {
            this._blitBoneData.removeEventListener(Event.CHANGE,this.dataChangeHandler);
         }
         this.checkedBlitBoneFrameChildren = null;
         this.readedChild = null;
         this.readedRules = null;
         this._blitBoneData = null;
         super.Dispose();
      }
      
      public function AddRule(param1:String, param2:Vector.<String>) : void
      {
         if(this.rules[param1] == null)
         {
            this.rules[param1] = param2;
         }
      }
      
      public function AddRootPreFixExpress(param1:String) : void
      {
         this.rulePreFixes.push(param1);
      }
      
      public function AddRootPostFixExpress(param1:String) : void
      {
         this.rulePostFixes.push(param1);
      }
      
      public function CheckSelfExpressAddRuleByMC(param1:MovieClip, param2:String) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Vector.<String> = null;
         var _loc7_:MovieClip = null;
         var _loc8_:String = null;
         var _loc3_:Boolean = this.CheckSelfExpressRootByClassName(param2);
         if(_loc3_)
         {
            _loc6_ = new Vector.<String>();
            _loc5_ = param1.numChildren;
            _loc4_ = 0;
            while(_loc4_ < _loc5_)
            {
               _loc7_ = param1.getChildAt(_loc4_) as MovieClip;
               _loc8_ = getQualifiedClassName(_loc7_);
               _loc6_.push(_loc8_);
               _loc4_++;
            }
            this.AddRule(param2,_loc6_);
            return false;
         }
         if(Blit.CheckIfMcToBlitBoneHasChildren(param1) && this.CheckSelfExpressNodeByClassName(param2))
         {
            return true;
         }
         return false;
      }
      
      private function CheckSelfExpressRootByClassName(param1:String) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = this.rulePreFixes.length;
         var _loc4_:Boolean = false;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(param1.indexOf(this.rulePreFixes[_loc2_]) == 0)
            {
               _loc4_ = true;
               break;
            }
            _loc2_++;
         }
         _loc3_ = this.rulePostFixes.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(param1.indexOf(this.rulePostFixes[_loc2_]) != -1)
            {
               _loc4_ = true;
               break;
            }
            _loc2_++;
         }
         return _loc4_;
      }
      
      private function CheckSelfExpressNodeByClassName(param1:String) : Boolean
      {
         var _loc2_:int = 0;
         var _loc4_:* = null;
         var _loc5_:Vector.<String> = null;
         var _loc3_:Matrix = new Matrix();
         for(_loc4_ in this.rules)
         {
            _loc5_ = this.rules[_loc4_];
            _loc2_ = 0;
            while(_loc2_ < _loc5_.length)
            {
               if(_loc5_[_loc2_] == param1)
               {
                  return true;
               }
               _loc2_++;
            }
         }
         return false;
      }
      
      public function GetRuleStringAt(param1:int, param2:String) : Vector.<String>
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:Vector.<String> = null;
         var _loc7_:Vector.<String> = null;
         for(_loc5_ in this.rules)
         {
            if(_loc3_++ == param1)
            {
               _loc6_ = this.rules[_loc5_];
               _loc7_ = new Vector.<String>();
               while(_loc4_ < _loc6_.length)
               {
                  _loc7_.push(param2 + "&" + _loc5_ + "&" + _loc6_[_loc4_]);
                  _loc4_++;
               }
               return _loc7_;
            }
         }
         return null;
      }
      
      public function CheckSelfExpressOk() : void
      {
         BlitBoneManager.impl.dispatchDebug(BlitBoneDataPluginDebug.BlitBoneDataOuterBindRule_CheckSelfExpressOk,[this]);
      }
      
      public function PushRootContainerToList(param1:Vector.<BitmapData>, param2:Array, param3:Vector.<BlitData>) : uint
      {
         var _loc5_:int = 0;
         var _loc6_:BlitFrameData = null;
         var _loc8_:String = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:BlitData = null;
         var _loc13_:Vector.<ChildNodeData> = null;
         var _loc14_:BitmapData = null;
         var _loc15_:ChildNodeData = null;
         var _loc4_:int = 0;
         var _loc7_:Matrix = new Matrix();
         for(_loc9_ in this.rules)
         {
            _loc10_ = 1;
            _loc11_ = 1;
            (_loc12_ = new BlitData()).name = _loc9_;
            _loc13_ = this.checkedNodes[_loc8_];
            _loc5_ = 0;
            while(_loc5_ < _loc13_.length)
            {
               if(_loc13_[_loc5_])
               {
                  _loc6_ = (_loc15_ = _loc13_[_loc5_]).bd.GetFrame(0);
                  if(_loc10_ < _loc6_.width)
                  {
                     _loc10_ = _loc6_.width;
                  }
                  if(_loc11_ < _loc6_.height)
                  {
                     _loc11_ = _loc6_.height;
                  }
               }
               _loc5_++;
            }
            _loc14_ = new BitmapData(_loc10_,_loc11_,true,Blit.COLOR_TRANSPARENT);
            _loc12_.LoadByBitmapData(_loc14_);
            _loc4_++;
            param2[_loc9_] = _loc12_;
            param3.push(_loc12_);
            param1.push(_loc14_);
         }
         return _loc4_;
      }
      
      public function CheckBindNodeBlitData(param1:BlitData) : Boolean
      {
         var _loc2_:int = 0;
         var _loc4_:* = null;
         var _loc5_:Vector.<String> = null;
         var _loc3_:Matrix = new Matrix();
         for(_loc4_ in this.rules)
         {
            _loc5_ = this.rules[_loc4_];
            if(this.checkedNodes[_loc4_] == null)
            {
               this.checkedNodes[_loc4_] = new Vector.<ChildNodeData>(_loc5_.length,true);
            }
            _loc2_ = 0;
            while(_loc2_ < _loc5_.length)
            {
               if(_loc5_[_loc2_] == param1.name)
               {
                  this.checkedNodes[_loc4_][_loc2_] = new ChildNodeData(param1);
                  return true;
               }
               _loc2_++;
            }
         }
         return false;
      }
      
      public function CheckBlitBoneFrameBatch(param1:BlitBoneFrameBatch) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = param1.children.length;
         while(_loc2_ < _loc3_)
         {
            this.CheckBlitBoneFrameChild(param1.children[_loc2_]);
            _loc2_++;
         }
      }
      
      public function CheckBlitBoneFrameChild(param1:BlitBoneFrameChild) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:BlitData = null;
         var _loc7_:BlitBoneFrameChild = null;
         var _loc8_:String = null;
         var _loc9_:Vector.<ChildNodeData> = null;
         var _loc10_:ChildNodeData = null;
         var _loc6_:Matrix = new Matrix();
         if(!this.checkedBlitBoneFrameChildren)
         {
            this.checkedBlitBoneFrameChildren = new Vector.<String>();
         }
         if(this.rules[param1.className])
         {
            if(param1.children)
            {
               _loc4_ = param1.children.length;
               _loc2_ = 0;
               while(_loc2_ < _loc4_)
               {
                  _loc8_ = (_loc7_ = param1.children[_loc2_]).className;
                  _loc9_ = this.checkedNodes[param1.className];
                  _loc3_ = 0;
                  while(_loc3_ < _loc9_.length)
                  {
                     if((_loc5_ = (_loc10_ = _loc9_[_loc3_]).bd).name == _loc8_ && this.checkedBlitBoneFrameChildren.indexOf(_loc8_) == -1)
                     {
                        _loc10_.child = _loc7_;
                        this.checkedBlitBoneFrameChildren.push(_loc8_);
                     }
                     _loc3_++;
                  }
                  _loc2_++;
               }
               param1.children = null;
            }
            param1.batches = null;
         }
         else
         {
            if(param1.children)
            {
               _loc4_ = param1.children.length;
               _loc2_ = 0;
               while(_loc2_ < _loc4_)
               {
                  this.CheckBlitBoneFrameChild(param1.children[_loc2_]);
                  _loc2_++;
               }
            }
            if(param1.batches)
            {
               _loc4_ = param1.batches.length;
               _loc2_ = 0;
               while(_loc2_ < _loc4_)
               {
                  this.CheckBlitBoneFrameBatch(param1.batches[_loc2_]);
                  _loc2_++;
               }
            }
         }
      }
      
      public function GetAllBytes() : Vector.<ByteArray>
      {
         var _loc1_:int = 0;
         var _loc3_:* = null;
         var _loc4_:Vector.<ChildNodeData> = null;
         var _loc5_:ChildNodeData = null;
         var _loc6_:BlitData = null;
         var _loc7_:BlitBoneFrameChild = null;
         var _loc8_:ByteArray = null;
         var _loc9_:ByteArray = null;
         var _loc2_:Vector.<ByteArray> = new Vector.<ByteArray>();
         for(_loc3_ in this.checkedNodes)
         {
            _loc4_ = this.checkedNodes[_loc3_];
            _loc1_ = 0;
            while(_loc1_ < _loc4_.length)
            {
               if(_loc4_[_loc1_])
               {
                  _loc6_ = (_loc5_ = _loc4_[_loc1_]).bd;
                  _loc7_ = _loc5_.child;
                  _loc6_.UnbatchData();
                  (_loc8_ = new ByteArray()).writeShort(BlitBone.FILE_TYPE_TAG_OUTER_BIND_RULE);
                  _loc8_.writeShort(TAG_ROOT_NAME);
                  _loc8_.writeUTF(_loc3_);
                  _loc8_.writeShort(TAG_NODE_NAME);
                  _loc8_.writeUTF(_loc6_.name);
                  _loc8_.writeShort(TAG_BLIT_DATA);
                  _loc9_ = _loc6_.GetContentBytes();
                  _loc8_.writeUnsignedInt(_loc9_.length);
                  _loc9_.compress();
                  _loc9_.position = 0;
                  _loc8_.writeUnsignedInt(_loc9_.length);
                  _loc8_.writeBytes(_loc9_);
                  _loc8_.writeShort(TAG_CHILD);
                  _loc7_.writeBytes(_loc8_);
                  _loc8_.position = 0;
                  _loc2_.push(_loc8_);
               }
               _loc1_++;
            }
         }
         return _loc2_;
      }
      
      public function LoadReadedRule(param1:BlitBoneDataOuterBindRule) : void
      {
         if(this.readedNodeName.indexOf(param1.readedNodeNameForBlitBoneData) == -1)
         {
            this.readedRootName.push(param1.readedRootNameForBlitBoneData);
            this.readedNodeName.push(param1.readedNodeNameForBlitBoneData);
            this.readedChild.push(param1.readedChildForBlitBoneData);
            this._blitBoneData.clearQuadBatchCache();
         }
         this.SetLoadOk();
         AsguiLogger.Log(this,"BlitBoneDataOuterBindRule LoadReadedRule : " + this._ruleCurrentString);
      }
      
      public function LoadBytes(param1:ByteArray) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:ByteArray = null;
         var _loc10_:BlitData = null;
         if(hasDisposed)
         {
            return;
         }
         var _loc4_:BlitData = new BlitData();
         var _loc5_:BlitBoneFrameChild = new BlitBoneFrameChild();
         param1.position = 0;
         do
         {
            _loc6_ = param1.readShort();
            switch(_loc6_)
            {
               case TAG_ROOT_NAME:
                  _loc2_ = param1.readUTF();
                  break;
               case TAG_NODE_NAME:
                  _loc3_ = param1.readUTF();
                  break;
               case TAG_BLIT_DATA:
                  _loc7_ = param1.readUnsignedInt();
                  _loc8_ = param1.readUnsignedInt();
                  _loc9_ = new ByteArray();
                  param1.readBytes(_loc9_,0,_loc8_);
                  _loc9_.uncompress();
                  _loc4_.SetContent(_loc9_);
                  BlitBoneManager.impl.dispatchDebug(BlitBoneDataPluginDebug.BlitBoneDataOuterBindRule_LoadBytes_BlitData,[_loc4_]);
                  break;
               case TAG_CHILD:
                  _loc5_.loadBytes(param1);
                  break;
            }
         }
         while(param1.bytesAvailable);
         
         if(this.blitBoneData)
         {
            if(this.autoMergeTexture)
            {
               _loc5_.className = _loc2_;
               if(_loc10_ = this.blitBoneData.blits[_loc2_])
               {
                  Blit.updateBlitDataFunc(_loc4_,_loc10_);
               }
            }
            else
            {
               _loc5_.className = _loc3_;
               this.blitBoneData.blits[_loc3_] = _loc4_;
            }
         }
         this.readedChildForBlitBoneData = _loc5_;
         this.readedRootNameForBlitBoneData = _loc2_;
         this.readedNodeNameForBlitBoneData = _loc3_;
         this.SetLoadOk();
         AsguiLogger.Log(this,"BlitBoneDataOuterBindRule LoadBytes : " + _loc2_ + "&" + _loc3_);
      }
      
      private function SetLoadOk() : void
      {
         var _loc1_:int = 0;
         _hasSettedRule = true;
         var _loc2_:int = this.readedChild.length;
         this._ruleCurrentString = "";
         while(_loc1_ < _loc2_)
         {
            if(!this.readedNodeName[_loc1_] || this.readedNodeName[_loc1_] == "")
            {
               this._ruleCurrentString += "";
            }
            else
            {
               this._ruleCurrentString += this.readedRootName[_loc1_] + "&" + this.readedNodeName[_loc1_];
            }
            _loc1_++;
         }
         this.dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function get blitBoneData() : BlitBoneData
      {
         return this._blitBoneData;
      }
      
      public function set blitBoneData(param1:BlitBoneData) : void
      {
         this._blitBoneData = param1;
         if(this._blitBoneData)
         {
            this._blitBoneData.removeEventListener(Event.CHANGE,this.dataChangeHandler);
            this._blitBoneData.addEventListener(Event.CHANGE,this.dataChangeHandler);
         }
      }
      
      protected function dataChangeHandler(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:BlitBoneDataOuterBindRule = null;
         for(_loc2_ in this.readedRules)
         {
            if(!this.readedRules[_loc2_] || this.readedRules[_loc2_] == 0)
            {
               this.readedRules[_loc2_] = this.blitBoneData.partOuterBindRuleDatas[_loc2_];
               _loc3_ = this.readedRules[_loc2_];
               if(_loc3_)
               {
                  this.LoadReadedRule(_loc3_);
               }
            }
         }
      }
      
      public function setScale(param1:Number) : void
      {
         this._scaleRate = param1;
      }
      
      public function CheckChildAddFlattenedDisplays(param1:BlitBoneFrameChild, param2:IBlitDisplayContainer, param3:BlitBoneData, param4:int, param5:BlitBoneVisibleRule, param6:Array, param7:int = 0, param8:BlitBoneDisplayHolder = null) : Boolean
      {
         var _loc9_:int = 0;
         if(hasDisposed)
         {
            return false;
         }
         var _loc10_:int = this.readedChild.length;
         while(_loc9_ < _loc10_)
         {
            if(this.readedRootName[_loc9_] && this.readedRootName[_loc9_] == param1.className && this.readedChild[_loc9_])
            {
               this.readedChild[_loc9_].addFlattenedDisplays(param2,param3,param4,param5,param6,param7,param8);
               return true;
            }
            _loc9_++;
         }
         return false;
      }
      
      public function CheckChildCreateShapeDisplay(param1:BlitBoneFrameChild, param2:Sprite, param3:BlitBoneData, param4:int, param5:BlitBoneVisibleRule = null) : Boolean
      {
         var _loc6_:int = 0;
         if(hasDisposed)
         {
            return false;
         }
         var _loc7_:int = this.readedChild.length;
         while(_loc6_ < _loc7_)
         {
            if(this.readedRootName[_loc6_] && this.readedRootName[_loc6_] == param1.className && this.readedChild[_loc6_])
            {
               param2.addChild(this.readedChild[_loc6_].createShapeDisplay(param3,param4,param5));
               return true;
            }
            _loc6_++;
         }
         return false;
      }
      
      public function ClearReadRule(param1:String = null) : void
      {
         var _loc2_:BlitData = null;
         var _loc3_:BlitFrameData = null;
         if(hasDisposed)
         {
            return;
         }
         this.readedRules = [];
         if(this.autoMergeTexture && param1 && this.blitBoneData && this.blitBoneData.blits)
         {
            _loc2_ = this.blitBoneData.blits[param1];
            if(_loc2_)
            {
               _loc3_ = _loc2_.GetFrame(0);
               _loc3_.bitmapData.fillRect(_loc3_.bitmapDataRect,Blit.COLOR_TRANSPARENT);
            }
         }
         this.readedChild.length = 0;
         this.readedNodeName.length = 0;
         this.readedRootName.length = 0;
         this._ruleCurrentString = "";
         _hasSettedRule = false;
      }
      
      public function AddReadRule(param1:String, param2:String) : void
      {
         var _loc3_:String = param1 + "&" + param2;
         if(this.readedRules[_loc3_] == null)
         {
            this.readedRules[_loc3_] = 0;
         }
      }
      
      override public function getRuleCurrentString() : String
      {
         return this._ruleCurrentString;
      }
   }
}

import asgui.blit.bone.BlitBoneFrameChild;
import asgui.blit.data.BlitData;

class ChildNodeData
{
    
   
   public var bd:BlitData;
   
   public var child:BlitBoneFrameChild;
   
   function ChildNodeData(param1:BlitData = null, param2:BlitBoneFrameChild = null)
   {
      super();
      this.bd = param1;
      this.child = param2;
   }
}
