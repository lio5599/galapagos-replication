; ModuleID = '/home/liolsen/galapagos-replication/functions/alsa-lib/variants/c/0_alaw_to_s16_0.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/alsa-lib/variants/c/0_alaw_to_s16_0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @alaw_to_s16(i8 noundef zeroext 97)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @alaw_to_s16(i8 noundef zeroext %a_val) #0 {
entry:
  %retval = alloca i32, align 4
  %a_val.addr = alloca i8, align 1
  %x = alloca i8, align 1
  %t = alloca i32, align 4
  %mag = alloca i32, align 4
  %seg = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  %conv1 = trunc i32 %xor to i8
  store i8 %conv1, ptr %x, align 1
  %1 = load i8, ptr %x, align 1
  %conv2 = zext i8 %1 to i32
  %and = and i32 %conv2, 127
  store i32 %and, ptr %t, align 4
  %2 = load i32, ptr %t, align 4
  %cmp = icmp sge i32 %2, 16
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %3 = load i32, ptr %t, align 4
  %shr = ashr i32 %3, 4
  %and4 = and i32 %shr, 7
  store i32 %and4, ptr %seg, align 4
  %4 = load i32, ptr %t, align 4
  %and5 = and i32 %4, 15
  %shl = shl i32 %and5, 4
  %add = add nsw i32 %shl, 264
  %5 = load i32, ptr %seg, align 4
  %sub = sub nsw i32 %5, 1
  %shl6 = shl i32 %add, %sub
  store i32 %shl6, ptr %mag, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %6 = load i32, ptr %t, align 4
  %shl7 = shl i32 %6, 4
  %add8 = add nsw i32 %shl7, 8
  store i32 %add8, ptr %mag, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %7 = load i8, ptr %x, align 1
  %conv9 = zext i8 %7 to i32
  %and10 = and i32 %conv9, 128
  %tobool = icmp ne i32 %and10, 0
  br i1 %tobool, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end
  %8 = load i32, ptr %mag, align 4
  store i32 %8, ptr %retval, align 4
  br label %return

if.end12:                                         ; preds = %if.end
  %9 = load i32, ptr %mag, align 4
  %sub13 = sub nsw i32 0, %9
  store i32 %sub13, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end12, %if.then11
  %10 = load i32, ptr %retval, align 4
  ret i32 %10
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
