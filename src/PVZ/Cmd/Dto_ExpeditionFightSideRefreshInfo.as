package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_ExpeditionFightSideRefreshInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ExpeditionFightSideRefreshInfo";
      
      public static const SIDEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightSideRefreshInfo.sideId","sideId",1 << 3 | WireType.VARINT);
      
      public static const CITY:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_ExpeditionFightSideRefreshInfo.city","city",2 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightCityRefreshInfo);
      
      public static const SCORETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightSideRefreshInfo.scoreTime","scoreTime",3 << 3 | WireType.VARINT);
       
      
      private var sideId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var city:Array;
      
      private var scoreTime$field:uint;
      
      public function Dto_ExpeditionFightSideRefreshInfo()
      {
         this.city = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ExpeditionFightSideRefreshInfo.$MessageID;
      }
      
      public function clearSideId() : void
      {
         this.hasField$0 &= 4294967294;
         this.sideId$field = new uint();
      }
      
      public function get hasSideId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set sideId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.sideId$field = param1;
      }
      
      public function get sideId() : uint
      {
         return this.sideId$field;
      }
      
      public function clearScoreTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.scoreTime$field = new uint();
      }
      
      public function get hasScoreTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set scoreTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.scoreTime$field = param1;
      }
      
      public function get scoreTime() : uint
      {
         return this.scoreTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasSideId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.sideId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.city.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.city[_loc2_]);
            _loc2_++;
         }
         if(this.hasScoreTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.scoreTime$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc5_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightSideRefreshInfo.sideId cannot be set twice.");
                  }
                  _loc3_++;
                  this.sideId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.city.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ExpeditionFightCityRefreshInfo()));
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightSideRefreshInfo.scoreTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.scoreTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
