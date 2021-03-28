package com.qq.modules.td.data.game
{
   import com.qq.modules.basic.data.IStaticData;
   
   public interface ITDStaticData extends IStaticData
   {
       
      
      function get actionNameList() : Array;
      
      function get actionRateList() : Array;
      
      function get extraBoneData() : Array;
      
      function get firePosOffsetX() : int;
      
      function get firePosOffsetY() : int;
      
      function get isSort() : Number;
      
      function get firePosBoneName() : String;
      
      function getParamStr(param1:int) : String;
      
      function getParam(param1:int) : Number;
      
      function hasParam(param1:int) : Boolean;
      
      function get type() : int;
      
      function get frameRate() : Number;
      
      function get resName() : String;
      
      function get resFileName() : String;
      
      function get isBlit() : Number;
      
      function get initBuffList() : Array;
      
      function get isNeedShade() : Boolean;
      
      function get butterPosList() : Array;
   }
}
