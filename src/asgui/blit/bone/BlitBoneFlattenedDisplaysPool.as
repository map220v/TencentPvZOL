package asgui.blit.bone
{
   import asgui.blit.display.IBlitClip;
   import flash.geom.ColorTransform;
   
   class BlitBoneFlattenedDisplaysPool
   {
      
      private static var _instance:BlitBoneFlattenedDisplaysPool;
       
      
      private var _colorTransform:ColorTransform;
      
      private var _colorTransformNew:ColorTransform;
      
      private var createCounter:int;
      
      private var blitClipList:Array;
      
      private var blitClipListIndex:Array;
      
      private var dataName:String = null;
      
      function BlitBoneFlattenedDisplaysPool()
      {
         this._colorTransform = new ColorTransform();
         this._colorTransformNew = new ColorTransform();
         this.blitClipList = [];
         this.blitClipListIndex = [];
         super();
      }
      
      public static function get instance() : BlitBoneFlattenedDisplaysPool
      {
         if(!_instance)
         {
            _instance = new BlitBoneFlattenedDisplaysPool();
         }
         return _instance;
      }
      
      public function getColorTransform(param1:Boolean = true) : ColorTransform
      {
         this._colorTransform.alphaMultiplier = this._colorTransformNew.alphaMultiplier;
         this._colorTransform.alphaOffset = this._colorTransformNew.alphaOffset;
         this._colorTransform.blueMultiplier = this._colorTransformNew.blueMultiplier;
         this._colorTransform.blueOffset = this._colorTransformNew.blueOffset;
         this._colorTransform.color = this._colorTransformNew.color;
         this._colorTransform.greenMultiplier = this._colorTransformNew.greenMultiplier;
         this._colorTransform.greenOffset = this._colorTransformNew.greenOffset;
         this._colorTransform.redMultiplier = this._colorTransformNew.redMultiplier;
         this._colorTransform.redOffset = this._colorTransformNew.redOffset;
         return this._colorTransform;
      }
      
      public function getBlitClip(param1:int, param2:String, param3:BlitBoneData) : IBlitClip
      {
         var _loc6_:IBlitClip = null;
         this.dataName = param1 + "_" + param3.url + "_" + param2;
         if(!this.blitClipList[this.dataName])
         {
            this.blitClipList[this.dataName] = new Vector.<IBlitClip>();
            this.blitClipListIndex[this.dataName] = 0;
         }
         var _loc4_:int = this.blitClipListIndex[this.dataName]++;
         var _loc5_:Vector.<IBlitClip> = this.blitClipList[this.dataName];
         while(_loc4_ >= _loc5_.length)
         {
            (_loc6_ = BlitBoneManager.impl.getBlitFactory(param1).CreateBlitClip({
               "smoothing":true,
               "mcInit":false
            })).dataProvider = param3.blits[param2];
            _loc5_.push(_loc6_);
            ++this.createCounter;
         }
         return _loc5_[_loc4_];
      }
      
      public function clearBlitClipList() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Vector.<IBlitClip> = null;
         for each(_loc2_ in this.blitClipList)
         {
            _loc1_ = 0;
            while(_loc1_ < _loc2_.length)
            {
               _loc2_[_loc1_].Dispose();
               _loc1_++;
            }
            _loc2_.length = 0;
         }
      }
      
      public function holdBlitClipList() : void
      {
         var _loc1_:* = null;
         for(_loc1_ in this.blitClipListIndex)
         {
            this.blitClipListIndex[_loc1_] = 0;
         }
      }
      
      public function releaseBlitClipList() : void
      {
      }
   }
}
