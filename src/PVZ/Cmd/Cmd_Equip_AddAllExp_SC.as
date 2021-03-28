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
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Equip_AddAllExp_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Equip_AddAllExp_SC";
      
      public static const EQUIPUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Equip_AddAllExp_SC.equipUId","equipUId",1 << 3 | WireType.VARINT);
      
      public static const ADDEXP:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Equip_AddAllExp_SC.addExp","addExp",2 << 3 | WireType.LENGTH_DELIMITED,Dto_Equip_AddExpInfo);
      
      public static const CHANGEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Equip_AddAllExp_SC.changeInfo","changeInfo",3 << 3 | WireType.LENGTH_DELIMITED,Dto_EquipInfo);
       
      
      private var equipUId$field:Int64;
      
      public var addExp:Array;
      
      private var changeInfo$field:Dto_EquipInfo;
      
      public function Cmd_Equip_AddAllExp_SC()
      {
         this.addExp = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Equip_AddAllExp_SC.$MessageID;
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
         var _loc3_:* = undefined;
         if(this.hasEquipUId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.equipUId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.addExp.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.addExp[_loc2_]);
            _loc2_++;
         }
         if(this.hasChangeInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.changeInfo$field);
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
                     throw new IOError("Bad data format: Cmd_Equip_AddAllExp_SC.equipUId cannot be set twice.");
                  }
                  _loc3_++;
                  this.equipUId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  this.addExp.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Equip_AddExpInfo()));
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Equip_AddAllExp_SC.changeInfo cannot be set twice.");
                  }
                  _loc4_++;
                  this.changeInfo = new Dto_EquipInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.changeInfo);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
