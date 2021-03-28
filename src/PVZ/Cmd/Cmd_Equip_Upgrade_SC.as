package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Equip_Upgrade_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Equip_Upgrade_SC";
      
      public static const EQUIPUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Equip_Upgrade_SC.equipUId","equipUId",1 << 3 | WireType.VARINT);
      
      public static const GRADEPERCENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Equip_Upgrade_SC.gradePercent","gradePercent",2 << 3 | WireType.VARINT);
      
      public static const CHANGEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Equip_Upgrade_SC.changeInfo","changeInfo",3 << 3 | WireType.LENGTH_DELIMITED,Dto_EquipInfo);
      
      public static const EQUIPBASEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Equip_Upgrade_SC.equipBaseId","equipBaseId",4 << 3 | WireType.VARINT);
       
      
      private var equipUId$field:Int64;
      
      private var gradePercent$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var changeInfo$field:Dto_EquipInfo;
      
      private var equipBaseId$field:uint;
      
      public function Cmd_Equip_Upgrade_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Equip_Upgrade_SC.$MessageID;
      }
      
      public function clearEquipUId() : void
      {
         this.equipUId$field = null;
      }
      
      public function get hasEquipUId() : Boolean
      {
         return this.equipUId$field != null;
      }
      
      public function set equipUId(param1:Int64) : void
      {
         this.equipUId$field = param1;
      }
      
      public function get equipUId() : Int64
      {
         return this.equipUId$field;
      }
      
      public function clearGradePercent() : void
      {
         this.hasField$0 &= 4294967294;
         this.gradePercent$field = new uint();
      }
      
      public function get hasGradePercent() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set gradePercent(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.gradePercent$field = param1;
      }
      
      public function get gradePercent() : uint
      {
         return this.gradePercent$field;
      }
      
      public function clearChangeInfo() : void
      {
         this.changeInfo$field = null;
      }
      
      public function get hasChangeInfo() : Boolean
      {
         return this.changeInfo$field != null;
      }
      
      public function set changeInfo(param1:Dto_EquipInfo) : void
      {
         this.changeInfo$field = param1;
      }
      
      public function get changeInfo() : Dto_EquipInfo
      {
         return this.changeInfo$field;
      }
      
      public function clearEquipBaseId() : void
      {
         this.hasField$0 &= 4294967293;
         this.equipBaseId$field = new uint();
      }
      
      public function get hasEquipBaseId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set equipBaseId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.equipBaseId$field = param1;
      }
      
      public function get equipBaseId() : uint
      {
         return this.equipBaseId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasEquipUId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.equipUId$field);
         }
         if(this.hasGradePercent)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.gradePercent$field);
         }
         if(this.hasChangeInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.changeInfo$field);
         }
         if(this.hasEquipBaseId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.equipBaseId$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc7_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Equip_Upgrade_SC.equipUId cannot be set twice.");
                  }
                  _loc3_++;
                  this.equipUId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Equip_Upgrade_SC.gradePercent cannot be set twice.");
                  }
                  _loc4_++;
                  this.gradePercent = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Equip_Upgrade_SC.changeInfo cannot be set twice.");
                  }
                  _loc5_++;
                  this.changeInfo = new Dto_EquipInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.changeInfo);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Equip_Upgrade_SC.equipBaseId cannot be set twice.");
                  }
                  _loc6_++;
                  this.equipBaseId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
