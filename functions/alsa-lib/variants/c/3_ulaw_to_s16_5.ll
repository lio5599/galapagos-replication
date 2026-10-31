; ModuleID = '/home/liolsen/galapagos-replication/functions/alsa-lib/variants/c/3_ulaw_to_s16_5.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/alsa-lib/variants/c/3_ulaw_to_s16_5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @ulaw_to_s16(i8 noundef zeroext 97)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @ulaw_to_s16(i8 noundef zeroext %u_val) #0 {
entry:
  %retval = alloca i32, align 4
  %u_val.addr = alloca i8, align 1
  %mantissa = alloca i32, align 4
  %exponent = alloca i32, align 4
  %t = alloca i32, align 4
  store i8 %u_val, ptr %u_val.addr, align 1
  %0 = load i8, ptr %u_val.addr, align 1
  %conv = zext i8 %0 to i32
  %and = and i32 %conv, 15
  %sub = sub nsw i32 15, %and
  store i32 %sub, ptr %mantissa, align 4
  %1 = load i8, ptr %u_val.addr, align 1
  %conv1 = zext i8 %1 to i32
  %shr = ashr i32 %conv1, 4
  %and2 = and i32 %shr, 7
  %sub3 = sub nsw i32 7, %and2
  store i32 %sub3, ptr %exponent, align 4
  %2 = load i32, ptr %mantissa, align 4
  %shl = shl i32 %2, 3
  %add = add nsw i32 %shl, 132
  %3 = load i32, ptr %exponent, align 4
  %shl4 = shl i32 %add, %3
  store i32 %shl4, ptr %t, align 4
  %4 = load i8, ptr %u_val.addr, align 1
  %conv5 = zext i8 %4 to i32
  %and6 = and i32 %conv5, 128
  %tobool = icmp ne i32 %and6, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %5 = load i32, ptr %t, align 4
  %sub7 = sub nsw i32 132, %5
  store i32 %sub7, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %6 = load i32, ptr %t, align 4
  %sub8 = sub nsw i32 %6, 132
  store i32 %sub8, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %7 = load i32, ptr %retval, align 4
  ret i32 %7
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
