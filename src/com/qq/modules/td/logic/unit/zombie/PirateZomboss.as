package com.qq.modules.td.logic.unit.zombie
{
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class PirateZomboss extends BasicZombie
   {
       
      
      private var _isIntro:Boolean;
      
      public function PirateZomboss()
      {
         super();
      }
      
      public function get isIntro() : Boolean
      {
         return this._isIntro;
      }
      
      public function set isIntro(param1:Boolean) : void
      {
         this._isIntro = param1;
      }
      
      public function get coverTileArr() : Array
      {
         var _loc1_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByGamePos(this.x,this.y);
         if(_loc1_)
         {
            return [[_loc1_.roadRow,_loc1_.roadCol + 1],[_loc1_.roadRow,_loc1_.roadCol],[_loc1_.roadRow,_loc1_.roadCol - 1],[_loc1_.roadRow + 1,_loc1_.roadCol + 1],[_loc1_.roadRow + 1,_loc1_.roadCol],[_loc1_.roadRow + 1,_loc1_.roadCol - 1]];
         }
         return null;
      }
      
      public function get isAtMaxCol() : Boolean
      {
         var _loc1_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByGamePos(this.x,this.y);
         if(_loc1_)
         {
            return _loc1_.roadCol >= TDGameInfo.getInstance().maxCol - 1;
         }
         return false;
      }
      
      public function get curPhase() : int
      {
         if(this.objectModel.curHp.get() > this.objectModel.maxHp.get() * 0.66)
         {
            return 1;
         }
         if(this.objectModel.curHp.get() > this.objectModel.maxHp.get() * 0.33)
         {
            return 2;
         }
         return 3;
      }
   }
}
