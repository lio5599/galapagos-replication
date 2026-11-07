; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/0_b64_byte_to_char_4.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/0_b64_byte_to_char_4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %result = alloca i32, align 4
  %i = alloca i32, align 4
  %bit = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  store i32 %and3, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %2, 62
  %shr5 = lshr i32 %sub4, 8
  %and6 = and i32 %shr5, 255
  store i32 %and6, ptr %c, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub7 = sub i32 0, %xor
  %shr8 = lshr i32 %sub7, 8
  %and9 = and i32 %shr8, 255
  %xor10 = xor i32 %and9, 255
  store i32 %xor10, ptr %d, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor11 = xor i32 %4, 63
  %sub12 = sub i32 0, %xor11
  %shr13 = lshr i32 %sub12, 8
  %and14 = and i32 %shr13, 255
  %xor15 = xor i32 %and14, 255
  store i32 %xor15, ptr %e, align 4
  store i32 0, ptr %result, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %5, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i32, ptr %i, align 4
  %shl = shl i32 1, %6
  store i32 %shl, ptr %bit, align 4
  %7 = load i32, ptr %a, align 4
  %8 = load i32, ptr %x.addr, align 4
  %add = add i32 %8, 65
  %and16 = and i32 %7, %add
  %9 = load i32, ptr %bit, align 4
  %and17 = and i32 %and16, %9
  %tobool = icmp ne i32 %and17, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %10 = load i32, ptr %a, align 4
  %xor18 = xor i32 %10, 255
  %11 = load i32, ptr %b, align 4
  %and19 = and i32 %xor18, %11
  %12 = load i32, ptr %x.addr, align 4
  %add20 = add i32 %12, 71
  %and21 = and i32 %and19, %add20
  %13 = load i32, ptr %bit, align 4
  %and22 = and i32 %and21, %13
  %tobool23 = icmp ne i32 %and22, 0
  br i1 %tobool23, label %if.then, label %lor.lhs.false24

lor.lhs.false24:                                  ; preds = %lor.lhs.false
  %14 = load i32, ptr %b, align 4
  %xor25 = xor i32 %14, 255
  %15 = load i32, ptr %c, align 4
  %and26 = and i32 %xor25, %15
  %16 = load i32, ptr %x.addr, align 4
  %add27 = add i32 %16, -4
  %and28 = and i32 %and26, %add27
  %17 = load i32, ptr %bit, align 4
  %and29 = and i32 %and28, %17
  %tobool30 = icmp ne i32 %and29, 0
  br i1 %tobool30, label %if.then, label %lor.lhs.false31

lor.lhs.false31:                                  ; preds = %lor.lhs.false24
  %18 = load i32, ptr %d, align 4
  %and32 = and i32 %18, 43
  %19 = load i32, ptr %bit, align 4
  %and33 = and i32 %and32, %19
  %tobool34 = icmp ne i32 %and33, 0
  br i1 %tobool34, label %if.then, label %lor.lhs.false35

lor.lhs.false35:                                  ; preds = %lor.lhs.false31
  %20 = load i32, ptr %e, align 4
  %and36 = and i32 %20, 47
  %21 = load i32, ptr %bit, align 4
  %and37 = and i32 %and36, %21
  %tobool38 = icmp ne i32 %and37, 0
  br i1 %tobool38, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false35, %lor.lhs.false31, %lor.lhs.false24, %lor.lhs.false, %for.body
  %22 = load i32, ptr %bit, align 4
  %23 = load i32, ptr %result, align 4
  %or = or i32 %23, %22
  store i32 %or, ptr %result, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false35
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %24 = load i32, ptr %i, align 4
  %inc = add i32 %24, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %25 = load i32, ptr %result, align 4
  ret i32 %25
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
