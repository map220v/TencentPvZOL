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
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Equip_AddExp_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Equip_AddExp_SC";
      
      public static const EQUIPUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Equip_AddExp_SC.equipUId","equipUId",1 << 3 | WireType.VARINT);
      
      public static const ADDEXP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Equip_AddExp_SC.addExp","addExp",2 << 3 | WireType.LENGTH_DELIMITED,Dto_Equip_AddExpInfo);
      
      public static const CHANGEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Equip_AddExp_SC.changeInfo","changeInfo",3 << 3 | WireType.LENGTH_DELIMITED,Dto_EquipInfo);
       
      
      private var equipUId$field:Int64;
      
      private var addExp$field:Dto_Equip_AddExpInfo;
      
      private var changeInfo$field:Dto_EquipInfo;
      
      public function Cmd_Equip_AddExp_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Equip_AddExp_SC.$MessageID;
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
      
      public function clearAddExp() : void
      {
         this.addExp$field = null;
      }
      
      public function get hasAddExp() : Boolean
      {
         return this.addExp$field != null;
      }
      
      public function set addExp(param1:Dto_Equip_AddExpInfo) : void
      {
         this.addExp$field = param1;
      }
      
      public function get addExp() : Dto_Equip_AddExpInfo
      {
         return this.addExp$field;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasEquipUId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.equipUId$field);
         }
         if(this.hasAddExp)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.addExp$field);
         }
         if(this.hasChangeInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.changeInfo$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Equip_AddExp_SC.equipUId cannot be set twice.");
                  }
                  _loc3_++;
                  this.equipUId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Equip_AddExp_SC.addExp cannot be set twice.");
                  }
                  _loc4_++;
                  this.addExp = new Dto_Equip_AddExpInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.addExp);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Equip_AddExp_SC.changeInfo cannot be set twice.");
                  }
                  _loc5_++;
                  this.changeInfo = new Dto_EquipInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.changeInfo);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
