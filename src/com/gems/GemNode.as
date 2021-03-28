package com.gems
{
   public class GemNode
   {
       
      
      private var _idx:int;
      
      private var _idy:int;
      
      private var _gem:GemBase;
      
      private var analogGem:GemBase;
      
      public function GemNode(param1:int, param2:int)
      {
         super();
         this._idx = param1;
         this._idy = param2;
      }
      
      public function get idx() : int
      {
         return this._idx;
      }
      
      public function get idy() : int
      {
         return this._idy;
      }
      
      public function setGem(param1:GemBase, param2:Boolean = false) : void
      {
         this._gem = param1;
         if(this._gem)
         {
            this.gem.create(this._idx,this._idy,param2);
         }
      }
      
      public function analogCreate(param1:GemBase = null) : void
      {
         if(this.analogGem)
         {
            this.analogGem.analogCreate();
         }
         this.analogGem = param1;
         if(this.analogGem)
         {
            this.analogGem.analogCreate(this._idx,this._idy);
         }
      }
      
      public function get gem() : GemBase
      {
         if(this.analogGem)
         {
            return this.analogGem;
         }
         return this._gem;
      }
   }
}
