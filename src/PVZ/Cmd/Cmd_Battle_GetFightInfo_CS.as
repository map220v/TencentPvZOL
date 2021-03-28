package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Battle_GetFightInfo_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Battle_GetFightInfo_CS";
      
      public static const TARGET:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Battle_GetFightInfo_CS.target","target",1 << 3 | WireType.LENGTH_DELIMITED,Dto_BattleTarget);
       
      
      private var target$field:Dto_BattleTarget;
      
      public function Cmd_Battle_GetFightInfo_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Battle_GetFightInfo_CS.$MessageID;
      }
      
      public function clearTarget() : void
      {
         this.target$field = null;
      }
      
      public function get hasTarget() : Boolean
      {
         return this.target$field != null;
      }
      
      public function set target(param1:Dto_BattleTarget) : void
      {
         this.target$field = param1;
      }
      
      public function get target() : Dto_BattleTarget
      {
         return this.target$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasTarget)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.target$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Battle_GetFightInfo_CS.target cannot be set twice.");
                  }
                  _loc3_++;
                  this.target = new Dto_BattleTarget();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.target);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
