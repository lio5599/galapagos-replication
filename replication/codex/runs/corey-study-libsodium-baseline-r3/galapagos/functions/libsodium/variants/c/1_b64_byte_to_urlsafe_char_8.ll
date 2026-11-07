; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_urlsafe_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_urlsafe_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %result = alloca i32, align 4
  %bit = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  store i32 %shr, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  store i32 %shr2, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub3 = sub i32 %2, 62
  %shr4 = lshr i32 %sub3, 8
  store i32 %shr4, ptr %c, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub5 = sub i32 0, %xor
  %shr6 = lshr i32 %sub5, 8
  store i32 %shr6, ptr %d, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor7 = xor i32 %4, 63
  %sub8 = sub i32 0, %xor7
  %shr9 = lshr i32 %sub8, 8
  store i32 %shr9, ptr %e, align 4
  store i32 0, ptr %result, align 4
  store i32 1, ptr %bit, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i32, ptr %bit, align 4
  %cmp = icmp ult i32 %5, 256
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i32, ptr %a, align 4
  %7 = load i32, ptr %x.addr, align 4
  %add = add i32 %7, 65
  %and = and i32 %6, %add
  %8 = load i32, ptr %bit, align 4
  %and10 = and i32 %and, %8
  %tobool = icmp ne i32 %and10, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %9 = load i32, ptr %a, align 4
  %not = xor i32 %9, -1
  %10 = load i32, ptr %b, align 4
  %and11 = and i32 %not, %10
  %11 = load i32, ptr %x.addr, align 4
  %add12 = add i32 %11, 71
  %and13 = and i32 %and11, %add12
  %12 = load i32, ptr %bit, align 4
  %and14 = and i32 %and13, %12
  %tobool15 = icmp ne i32 %and14, 0
  br i1 %tobool15, label %if.then, label %lor.lhs.false16

lor.lhs.false16:                                  ; preds = %lor.lhs.false
  %13 = load i32, ptr %b, align 4
  %not17 = xor i32 %13, -1
  %14 = load i32, ptr %c, align 4
  %and18 = and i32 %not17, %14
  %15 = load i32, ptr %x.addr, align 4
  %add19 = add i32 %15, -4
  %and20 = and i32 %and18, %add19
  %16 = load i32, ptr %bit, align 4
  %and21 = and i32 %and20, %16
  %tobool22 = icmp ne i32 %and21, 0
  br i1 %tobool22, label %if.then, label %lor.lhs.false23

lor.lhs.false23:                                  ; preds = %lor.lhs.false16
  %17 = load i32, ptr %d, align 4
  %not24 = xor i32 %17, -1
  %and25 = and i32 %not24, 45
  %18 = load i32, ptr %bit, align 4
  %and26 = and i32 %and25, %18
  %tobool27 = icmp ne i32 %and26, 0
  br i1 %tobool27, label %if.then, label %lor.lhs.false28

lor.lhs.false28:                                  ; preds = %lor.lhs.false23
  %19 = load i32, ptr %e, align 4
  %not29 = xor i32 %19, -1
  %and30 = and i32 %not29, 95
  %20 = load i32, ptr %bit, align 4
  %and31 = and i32 %and30, %20
  %tobool32 = icmp ne i32 %and31, 0
  br i1 %tobool32, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false28, %lor.lhs.false23, %lor.lhs.false16, %lor.lhs.false, %for.body
  %21 = load i32, ptr %bit, align 4
  %22 = load i32, ptr %result, align 4
  %or = or i32 %22, %21
  store i32 %or, ptr %result, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false28
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %23 = load i32, ptr %bit, align 4
  %shl = shl i32 %23, 1
  store i32 %shl, ptr %bit, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %24 = load i32, ptr %result, align 4
  ret i32 %24
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
