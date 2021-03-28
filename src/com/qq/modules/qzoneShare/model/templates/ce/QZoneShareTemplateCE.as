package com.qq.modules.qzoneShare.model.templates.ce
{
   public class QZoneShareTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _title:String;
      
      protected var _summary:String;
      
      protected var _type:Number;
      
      protected var _tdId:String;
      
      protected var _tdStar:Number;
      
      protected var _fubenID:Number;
      
      protected var _fubenStar:Number;
      
      protected var _cardStar:Number;
      
      protected var _talentId:Number;
      
      protected var _desc:String;
      
      protected var _img:Number;
      
      protected var _rewardTimes:Number;
      
      protected var _everyDayTimes:Number;
      
      protected var _reward:String;
      
      protected var _winTitle:String;
      
      protected var _leftImg:String;
      
      protected var _rightDesc:String;
      
      public function QZoneShareTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._title = param1.title;
         this._summary = param1.summary;
         this._type = param1.type;
         this._tdId = param1.tdId;
         this._tdStar = param1.tdStar;
         this._fubenID = param1.fubenID;
         this._fubenStar = param1.fubenStar;
         this._cardStar = param1.cardStar;
         this._talentId = param1.talentId;
         this._desc = param1.desc;
         this._img = param1.img;
         this._rewardTimes = param1.rewardTimes;
         this._everyDayTimes = param1.everyDayTimes;
         this._reward = param1.reward;
         this._winTitle = param1.winTitle;
         this._leftImg = param1.leftImg;
         this._rightDesc = param1.rightDesc;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get title() : String
      {
         return this._title;
      }
      
      public function get summary() : String
      {
         return this._summary;
      }
      
      public function get type() : Number
      {
         return this._type;
      }
      
      public function get tdId() : String
      {
         return this._tdId;
      }
      
      public function get tdStar() : Number
      {
         return this._tdStar;
      }
      
      public function get fubenID() : Number
      {
         return this._fubenID;
      }
      
      public function get fubenStar() : Number
      {
         return this._fubenStar;
      }
      
      public function get cardStar() : Number
      {
         return this._cardStar;
      }
      
      public function get talentId() : Number
      {
         return this._talentId;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function get img() : Number
      {
         return this._img;
      }
      
      public function get rewardTimes() : Number
      {
         return this._rewardTimes;
      }
      
      public function get everyDayTimes() : Number
      {
         return this._everyDayTimes;
      }
      
      public function get reward() : String
      {
         return this._reward;
      }
      
      public function get winTitle() : String
      {
         return this._winTitle;
      }
      
      public function get leftImg() : String
      {
         return this._leftImg;
      }
      
      public function get rightDesc() : String
      {
         return this._rightDesc;
      }
   }
}
