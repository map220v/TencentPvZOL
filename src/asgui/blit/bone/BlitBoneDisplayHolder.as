package asgui.blit.bone
{
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayObject;

   public final class BlitBoneDisplayHolder
   {
       
      
      public var displays:Array;
      
      private var type:int;
      
      public function BlitBoneDisplayHolder(param1:int = 0)
      {
         this.displays = [];
         super();
         this.type = param1;
      }
      
      public function reset() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Vector.<IBlitDisplayObject> = null;
         for each(_loc2_ in this.displays)
         {
            _loc1_ = 0;
            while(_loc1_ < _loc2_.length)
            {
               _loc2_[_loc1_].Dispose();
               _loc1_++;
            }
         }
         this.displays = [];
      }
      
      public function Dispose() : void
      {
         this.reset();
         this.displays = null;
      }
      
      public function getDisplayByNameCompare(param1:String, param2:Boolean = false) : Vector.<IBlitDisplayObject>
      {
         var _loc4_:IBlitDisplayObject = null;
         var _loc3_:Array = [];
         for each(_loc4_ in this.displays)
         {
            if(!param2 == (_loc4_.name.indexOf(param1) != -1))
            {
               _loc3_.push(_loc4_);
            }
         }
         return Vector.<IBlitDisplayObject>(_loc3_);
      }
      
      public function getDisplays(param1:String) : Vector.<IBlitDisplayObject>
      {
         if(this.displays[param1] == null)
         {
            this.displays[param1] = new Vector.<IBlitDisplayObject>();
         }
         return this.displays[param1];
      }
      
      public function getDisplay(param1:String) : IBlitDisplayObject
      {
         var _loc2_:int = 0;
         var _loc3_:IBlitDisplayObject = null;
         if(this.displays[param1] == null)
         {
            this.displays[param1] = new Vector.<IBlitDisplayObject>();
         }
         var _loc4_:Vector.<IBlitDisplayObject> = this.displays[param1];
         _loc2_ = 0;
         while(_loc2_ < _loc4_.length)
         {
            _loc3_ = _loc4_[_loc2_] as IBlitDisplayObject;
            if(_loc3_.GetParent() != null)
            {
               return _loc3_;
            }
            _loc2_++;
         }
         return _loc3_;
      }
      
      public function getEmptyClip(param1:String, param2:BlitBoneData, param3:Boolean = true) : IBlitClip
      {
         var _loc4_:int = 0;
         var _loc5_:IBlitDisplayObject = null;
         var _loc7_:IBlitClip = null;
         if(this.displays[param1] == null)
         {
            this.displays[param1] = new Vector.<IBlitDisplayObject>();
         }
         var _loc6_:Vector.<IBlitDisplayObject> = this.displays[param1];
         _loc4_ = 0;
         while(_loc4_ < _loc6_.length)
         {
            if((_loc5_ = _loc6_[_loc4_] as IBlitDisplayObject).GetParent() == null)
            {
               return _loc5_ as IBlitClip;
            }
            _loc4_++;
         }
         if(_loc4_ == _loc6_.length)
         {
            _loc7_ = BlitBoneManager.impl.getBlitFactory(this.type).CreateBlitClip({
               "smoothing":true,
               "mcInit":param3
            })
            _loc7_.dataProvider = param2.blits[param1];
            _loc7_.name = param1;
            _loc6_.push(_loc7_);
            return _loc7_;
         }
         return _loc5_ as IBlitClip;
      }
   }
}
