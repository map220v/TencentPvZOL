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
   
   public final class Cmd_ExpeditionFight_SpyCityRole_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_ExpeditionFight_SpyCityRole_SC";
      
      public static const SIDEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_SpyCityRole_SC.sideId","sideId",1 << 3 | WireType.VARINT);
      
      public static const CITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_SpyCityRole_SC.cityId","cityId",2 << 3 | WireType.VARINT);
      
      public static const ROLEINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_SpyCityRole_SC.roleInfo","roleInfo",3 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightCityRoleInfo);
       
      
      private var sideId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var cityId$field:uint;
      
      public var roleInfo:Array;
      
      public function Cmd_ExpeditionFight_SpyCityRole_SC()
      {
         this.roleInfo = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_ExpeditionFight_SpyCityRole_SC.$MessageID;
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
      
      public function clearCityId() : void
      {
         this.hasField$0 &= 4294967293;
         this.cityId$field = new uint();
      }
      
      public function get hasCityId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set cityId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.cityId$field = param1;
      }
      
      public function get cityId() : uint
      {
         return this.cityId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasSideId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.sideId$field);
         }
         if(this.hasCityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.cityId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.roleInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.roleInfo[_loc2_]);
            _loc2_++;
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
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_SpyCityRole_SC.sideId cannot be set twice.");
                  }
                  _loc3_++;
                  this.sideId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_SpyCityRole_SC.cityId cannot be set twice.");
                  }
                  _loc4_++;
                  this.cityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  this.roleInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ExpeditionFightCityRoleInfo()));
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
