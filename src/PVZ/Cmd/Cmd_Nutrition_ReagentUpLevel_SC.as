package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Nutrition_ReagentUpLevel_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Nutrition_ReagentUpLevel_SC";
      
      public static const REAGENT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Nutrition_ReagentUpLevel_SC.reagent","reagent",1 << 3 | WireType.LENGTH_DELIMITED,Dto_Reagent);
      
      public static const BOTTLEEXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_ReagentUpLevel_SC.bottleExp","bottleExp",2 << 3 | WireType.VARINT);
       
      
      private var reagent$field:Dto_Reagent;
      
      private var bottleExp$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_Nutrition_ReagentUpLevel_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Nutrition_ReagentUpLevel_SC.$MessageID;
      }
      
      public function clearReagent() : void
      {
         this.reagent$field = null;
      }
      
      public function get hasReagent() : Boolean
      {
         return this.reagent$field != null;
      }
      
      public function set reagent(param1:Dto_Reagent) : void
      {
         this.reagent$field = param1;
      }
      
      public function get reagent() : Dto_Reagent
      {
         return this.reagent$field;
      }
      
      public function clearBottleExp() : void
      {
         this.hasField$0 &= 4294967294;
         this.bottleExp$field = new uint();
      }
      
      public function get hasBottleExp() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set bottleExp(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.bottleExp$field = param1;
      }
      
      public function get bottleExp() : uint
      {
         return this.bottleExp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasReagent)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reagent$field);
         }
         if(this.hasBottleExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.bottleExp$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Cmd_Nutrition_ReagentUpLevel_SC.reagent cannot be set twice.");
                  }
                  _loc3_++;
                  this.reagent = new Dto_Reagent();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.reagent);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Nutrition_ReagentUpLevel_SC.bottleExp cannot be set twice.");
                  }
                  _loc4_++;
                  this.bottleExp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
