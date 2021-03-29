package com.qq.modules.arena.model.templates
{
   import com.qq.modules.arena.model.templates.ce.ArenaGroupSettingCE;
   
   public class ArenaGroupSetting extends ArenaGroupSettingCE
   {
       
      
      private var _upRankList:Array;
      
      private var _dowmRankList:Array;
      
      public function ArenaGroupSetting()
      {
         super();
      }
      
      override public function load(param1:Object) : void
      {
         super.load(param1);
         this._upRankList = _upRank != "" ? _upRank.split(",") : [];
         this._dowmRankList = _downRank != "" ? _downRank.split(",") : [];
      }
      
      public function get upRank_to() : int
      {
         return Number(this._upRankList[1]);
      }
      
      public function get upRank_from() : int
      {
         return Number(this._upRankList[0]);
      }
      
      public function get downRank_to() : int
      {
         return Number(this._dowmRankList[1]);
      }
      
      public function get downRank_from() : int
      {
         return Number(this._dowmRankList[0]);
      }
   }
}
