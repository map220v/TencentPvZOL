package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_ExpeditionFight_CityRole_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_ExpeditionFight_CityRole_SC";
      
      public static const CITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_CityRole_SC.cityId","cityId",1 << 3 | WireType.VARINT);
      
      public static const PAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_CityRole_SC.page","page",2 << 3 | WireType.VARINT);
      
      public static const SUMPAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_CityRole_SC.sumPage","sumPage",3 << 3 | WireType.VARINT);
      
      public static const ROLEINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_CityRole_SC.roleInfo","roleInfo",4 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightCityRoleInfo);
      
      public static const SELFINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_CityRole_SC.selfInfo","selfInfo",5 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightCityRoleInfo);
      
      public static const HPRATIO:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_CityRole_SC.hpRatio","hpRatio",6 << 3 | WireType.VARINT);
      
      public static const HIDDEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_ExpeditionFight_CityRole_SC.hidden","hidden",7 << 3 | WireType.VARINT);
       
      
      private var cityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var page$field:uint;
      
      private var sumPage$field:uint;
      
      public var roleInfo:Array;
      
      private var selfInfo$field:Dto_ExpeditionFightCityRoleInfo;
      
      private var hpRatio$field:uint;
      
      private var hidden$field:Boolean;
      
      public function Cmd_ExpeditionFight_CityRole_SC()
      {
         this.roleInfo = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_ExpeditionFight_CityRole_SC.$MessageID;
      }
      
      public function clearCityId() : void
      {
         this.hasField$0 &= 4294967294;
         this.cityId$field = new uint();
      }
      
      public function get hasCityId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set cityId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.cityId$field = param1;
      }
      
      public function get cityId() : uint
      {
         return this.cityId$field;
      }
      
      public function clearPage() : void
      {
         this.hasField$0 &= 4294967293;
         this.page$field = new uint();
      }
      
      public function get hasPage() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set page(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.page$field = param1;
      }
      
      public function get page() : uint
      {
         return this.page$field;
      }
      
      public function clearSumPage() : void
      {
         this.hasField$0 &= 4294967291;
         this.sumPage$field = new uint();
      }
      
      public function get hasSumPage() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set sumPage(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.sumPage$field = param1;
      }
      
      public function get sumPage() : uint
      {
         return this.sumPage$field;
      }
      
      public function clearSelfInfo() : void
      {
         this.selfInfo$field = null;
      }
      
      public function get hasSelfInfo() : Boolean
      {
         return this.selfInfo$field != null;
      }
      
      public function set selfInfo(param1:Dto_ExpeditionFightCityRoleInfo) : void
      {
         this.selfInfo$field = param1;
      }
      
      public function get selfInfo() : Dto_ExpeditionFightCityRoleInfo
      {
         return this.selfInfo$field;
      }
      
      public function clearHpRatio() : void
      {
         this.hasField$0 &= 4294967287;
         this.hpRatio$field = new uint();
      }
      
      public function get hasHpRatio() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set hpRatio(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.hpRatio$field = param1;
      }
      
      public function get hpRatio() : uint
      {
         return this.hpRatio$field;
      }
      
      public function clearHidden() : void
      {
         this.hasField$0 &= 4294967279;
         this.hidden$field = new Boolean();
      }
      
      public function get hasHidden() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set hidden(param1:Boolean) : void
      {
         this.hasField$0 |= 16;
         this.hidden$field = param1;
      }
      
      public function get hidden() : Boolean
      {
         return this.hidden$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasCityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.cityId$field);
         }
         if(this.hasPage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.page$field);
         }
         if(this.hasSumPage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.sumPage$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.roleInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.roleInfo[_loc2_]);
            _loc2_++;
         }
         if(this.hasSelfInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.selfInfo$field);
         }
         if(this.hasHpRatio)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.hpRatio$field);
         }
         if(this.hasHidden)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_BOOL(param1,this.hidden$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc9_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc9_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_CityRole_SC.cityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.cityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_CityRole_SC.page cannot be set twice.");
                  }
                  _loc4_++;
                  this.page = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_CityRole_SC.sumPage cannot be set twice.");
                  }
                  _loc5_++;
                  this.sumPage = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  this.roleInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ExpeditionFightCityRoleInfo()));
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_CityRole_SC.selfInfo cannot be set twice.");
                  }
                  _loc6_++;
                  this.selfInfo = new Dto_ExpeditionFightCityRoleInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.selfInfo);
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_CityRole_SC.hpRatio cannot be set twice.");
                  }
                  _loc7_++;
                  this.hpRatio = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_CityRole_SC.hidden cannot be set twice.");
                  }
                  _loc8_++;
                  this.hidden = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
