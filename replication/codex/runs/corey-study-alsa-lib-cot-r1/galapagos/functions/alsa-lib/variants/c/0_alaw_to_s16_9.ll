; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-cot-r1/functions/alsa-lib/variants/c/0_alaw_to_s16_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-cot-r1/functions/alsa-lib/variants/c/0_alaw_to_s16_9.c"
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
  %a_val.addr = alloca i8, align 1
  %x = alloca i32, align 4
  %seg = alloca i32, align 4
  %exponent = alloca i32, align 4
  %step = alloca i32, align 4
  %t = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  store i32 %xor, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  %shr = ashr i32 %1, 4
  %and = and i32 %shr, 7
  store i32 %and, ptr %seg, align 4
  %2 = load i32, ptr %seg, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %3 = load i32, ptr %seg, align 4
  %sub = sub nsw i32 %3, 1
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, ptr %exponent, align 4
  %4 = load i32, ptr %exponent, align 4
  %shl = shl i32 16, %4
  store i32 %shl, ptr %step, align 4
  %5 = load i32, ptr %seg, align 4
  %tobool1 = icmp ne i32 %5, 0
  %6 = zext i1 %tobool1 to i64
  %cond2 = select i1 %tobool1, i32 264, i32 8
  %7 = load i32, ptr %exponent, align 4
  %shl3 = shl i32 %cond2, %7
  store i32 %shl3, ptr %t, align 4
  %8 = load i32, ptr %x, align 4
  %and4 = and i32 %8, 1
  %tobool5 = icmp ne i32 %and4, 0
  br i1 %tobool5, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %9 = load i32, ptr %step, align 4
  %10 = load i32, ptr %t, align 4
  %add = add nsw i32 %10, %9
  store i32 %add, ptr %t, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %11 = load i32, ptr %x, align 4
  %and6 = and i32 %11, 2
  %tobool7 = icmp ne i32 %and6, 0
  br i1 %tobool7, label %if.then8, label %if.end10

if.then8:                                         ; preds = %if.end
  %12 = load i32, ptr %step, align 4
  %mul = mul nsw i32 %12, 2
  %13 = load i32, ptr %t, align 4
  %add9 = add nsw i32 %13, %mul
  store i32 %add9, ptr %t, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then8, %if.end
  %14 = load i32, ptr %x, align 4
  %and11 = and i32 %14, 4
  %tobool12 = icmp ne i32 %and11, 0
  br i1 %tobool12, label %if.then13, label %if.end16

if.then13:                                        ; preds = %if.end10
  %15 = load i32, ptr %step, align 4
  %mul14 = mul nsw i32 %15, 4
  %16 = load i32, ptr %t, align 4
  %add15 = add nsw i32 %16, %mul14
  store i32 %add15, ptr %t, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then13, %if.end10
  %17 = load i32, ptr %x, align 4
  %and17 = and i32 %17, 8
  %tobool18 = icmp ne i32 %and17, 0
  br i1 %tobool18, label %if.then19, label %if.end22

if.then19:                                        ; preds = %if.end16
  %18 = load i32, ptr %step, align 4
  %mul20 = mul nsw i32 %18, 8
  %19 = load i32, ptr %t, align 4
  %add21 = add nsw i32 %19, %mul20
  store i32 %add21, ptr %t, align 4
  br label %if.end22

if.end22:                                         ; preds = %if.then19, %if.end16
  %20 = load i32, ptr %x, align 4
  %and23 = and i32 %20, 128
  %tobool24 = icmp ne i32 %and23, 0
  br i1 %tobool24, label %cond.true25, label %cond.false26

cond.true25:                                      ; preds = %if.end22
  %21 = load i32, ptr %t, align 4
  br label %cond.end28

cond.false26:                                     ; preds = %if.end22
  %22 = load i32, ptr %t, align 4
  %sub27 = sub nsw i32 0, %22
  br label %cond.end28

cond.end28:                                       ; preds = %cond.false26, %cond.true25
  %cond29 = phi i32 [ %21, %cond.true25 ], [ %sub27, %cond.false26 ]
  ret i32 %cond29
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
