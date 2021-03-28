package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Melee_GetRankList_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Melee_GetRankList_SC";
      
      public static const RANKLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Melee_GetRankList_SC.rankList","rankList",1 << 3 | WireType.LENGTH_DELIMITED,Dto_MeleeRankInfo);
      
      public static const MYRANKINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Melee_GetRankList_SC.myRankInfo","myRankInfo",2 << 3 | WireType.LENGTH_DELIMITED,Dto_MeleeRankInfo);
       
      
      public var rankList:Array;
      
      private var myRankInfo$field:Dto_MeleeRankInfo;
      
      public function Cmd_Melee_GetRankList_SC()
      {
         this.rankList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Melee_GetRankList_SC.$MessageID;
      }
      
      public function clearMyRankInfo() : void
      {
         this.myRankInfo$field = null;
      }
      
      public function get hasMyRankInfo() : Boolean
      {
         return this.myRankInfo$field != null;
      }
      
      public function set myRankInfo(param1:Dto_MeleeRankInfo) : void
      {
         this.myRankInfo$field = param1;
      }
      
      public function get myRankInfo() : Dto_MeleeRankInfo
      {
         return this.myRankInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.rankList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rankList[_loc2_]);
            _loc2_++;
         }
         if(this.hasMyRankInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.myRankInfo$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc4_ >> 3)
            {
               case 1:
                  this.rankList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_MeleeRankInfo()));
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Melee_GetRankList_SC.myRankInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.myRankInfo = new Dto_MeleeRankInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.myRankInfo);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
