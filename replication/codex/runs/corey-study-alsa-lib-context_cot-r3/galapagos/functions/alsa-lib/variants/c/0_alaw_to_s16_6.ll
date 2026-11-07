; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context_cot-r3/functions/alsa-lib/variants/c/0_alaw_to_s16_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context_cot-r3/functions/alsa-lib/variants/c/0_alaw_to_s16_6.c"
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
  %code = alloca i32, align 4
  %t = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  store i32 %xor, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  %and = and i32 %1, 127
  store i32 %and, ptr %code, align 4
  %2 = load i32, ptr %code, align 4
  %and1 = and i32 %2, 15
  %mul = mul nsw i32 %and1, 16
  %add = add nsw i32 %mul, 8
  store i32 %add, ptr %t, align 4
  %3 = load i32, ptr %code, align 4
  %cmp = icmp sge i32 %3, 16
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i32, ptr %t, align 4
  %add3 = add nsw i32 %4, 256
  store i32 %add3, ptr %t, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32, ptr %code, align 4
  %cmp4 = icmp sge i32 %5, 32
  br i1 %cmp4, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.end
  %6 = load i32, ptr %t, align 4
  %7 = load i32, ptr %t, align 4
  %add7 = add nsw i32 %7, %6
  store i32 %add7, ptr %t, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.then6, %if.end
  %8 = load i32, ptr %code, align 4
  %cmp9 = icmp sge i32 %8, 48
  br i1 %cmp9, label %if.then11, label %if.end13

if.then11:                                        ; preds = %if.end8
  %9 = load i32, ptr %t, align 4
  %10 = load i32, ptr %t, align 4
  %add12 = add nsw i32 %10, %9
  store i32 %add12, ptr %t, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then11, %if.end8
  %11 = load i32, ptr %code, align 4
  %cmp14 = icmp sge i32 %11, 64
  br i1 %cmp14, label %if.then16, label %if.end18

if.then16:                                        ; preds = %if.end13
  %12 = load i32, ptr %t, align 4
  %13 = load i32, ptr %t, align 4
  %add17 = add nsw i32 %13, %12
  store i32 %add17, ptr %t, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then16, %if.end13
  %14 = load i32, ptr %code, align 4
  %cmp19 = icmp sge i32 %14, 80
  br i1 %cmp19, label %if.then21, label %if.end23

if.then21:                                        ; preds = %if.end18
  %15 = load i32, ptr %t, align 4
  %16 = load i32, ptr %t, align 4
  %add22 = add nsw i32 %16, %15
  store i32 %add22, ptr %t, align 4
  br label %if.end23

if.end23:                                         ; preds = %if.then21, %if.end18
  %17 = load i32, ptr %code, align 4
  %cmp24 = icmp sge i32 %17, 96
  br i1 %cmp24, label %if.then26, label %if.end28

if.then26:                                        ; preds = %if.end23
  %18 = load i32, ptr %t, align 4
  %19 = load i32, ptr %t, align 4
  %add27 = add nsw i32 %19, %18
  store i32 %add27, ptr %t, align 4
  br label %if.end28

if.end28:                                         ; preds = %if.then26, %if.end23
  %20 = load i32, ptr %code, align 4
  %cmp29 = icmp sge i32 %20, 112
  br i1 %cmp29, label %if.then31, label %if.end33

if.then31:                                        ; preds = %if.end28
  %21 = load i32, ptr %t, align 4
  %22 = load i32, ptr %t, align 4
  %add32 = add nsw i32 %22, %21
  store i32 %add32, ptr %t, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.then31, %if.end28
  %23 = load i32, ptr %x, align 4
  %and34 = and i32 %23, 128
  %tobool = icmp ne i32 %and34, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end33
  %24 = load i32, ptr %t, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end33
  %25 = load i32, ptr %t, align 4
  %sub = sub nsw i32 0, %25
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %24, %cond.true ], [ %sub, %cond.false ]
  ret i32 %cond
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
