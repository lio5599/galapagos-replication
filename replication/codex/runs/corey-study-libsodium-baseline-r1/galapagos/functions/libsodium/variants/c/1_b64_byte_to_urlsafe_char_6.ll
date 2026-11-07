; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r1/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r1/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_6.c"
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
  %r = alloca i32, align 4
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
  store i32 0, ptr %r, align 4
  %5 = load i32, ptr %a, align 4
  %cmp = icmp ne i32 %5, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %6 = load i32, ptr %a, align 4
  %7 = load i32, ptr %x.addr, align 4
  %add = add i32 %7, 65
  %and16 = and i32 %6, %add
  %8 = load i32, ptr %r, align 4
  %or = or i32 %8, %and16
  store i32 %or, ptr %r, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %9 = load i32, ptr %a, align 4
  %xor17 = xor i32 %9, 255
  %cmp18 = icmp ne i32 %xor17, 0
  br i1 %cmp18, label %if.then19, label %if.end25

if.then19:                                        ; preds = %if.end
  %10 = load i32, ptr %a, align 4
  %xor20 = xor i32 %10, 255
  %11 = load i32, ptr %b, align 4
  %and21 = and i32 %xor20, %11
  %12 = load i32, ptr %x.addr, align 4
  %add22 = add i32 %12, 71
  %and23 = and i32 %and21, %add22
  %13 = load i32, ptr %r, align 4
  %or24 = or i32 %13, %and23
  store i32 %or24, ptr %r, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.then19, %if.end
  %14 = load i32, ptr %b, align 4
  %xor26 = xor i32 %14, 255
  %cmp27 = icmp ne i32 %xor26, 0
  br i1 %cmp27, label %if.then28, label %if.end34

if.then28:                                        ; preds = %if.end25
  %15 = load i32, ptr %b, align 4
  %xor29 = xor i32 %15, 255
  %16 = load i32, ptr %c, align 4
  %and30 = and i32 %xor29, %16
  %17 = load i32, ptr %x.addr, align 4
  %add31 = add i32 %17, -4
  %and32 = and i32 %and30, %add31
  %18 = load i32, ptr %r, align 4
  %or33 = or i32 %18, %and32
  store i32 %or33, ptr %r, align 4
  br label %if.end34

if.end34:                                         ; preds = %if.then28, %if.end25
  %19 = load i32, ptr %d, align 4
  %cmp35 = icmp ne i32 %19, 0
  br i1 %cmp35, label %if.then36, label %if.end39

if.then36:                                        ; preds = %if.end34
  %20 = load i32, ptr %d, align 4
  %and37 = and i32 %20, 45
  %21 = load i32, ptr %r, align 4
  %or38 = or i32 %21, %and37
  store i32 %or38, ptr %r, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.then36, %if.end34
  %22 = load i32, ptr %e, align 4
  %cmp40 = icmp ne i32 %22, 0
  br i1 %cmp40, label %if.then41, label %if.end44

if.then41:                                        ; preds = %if.end39
  %23 = load i32, ptr %e, align 4
  %and42 = and i32 %23, 95
  %24 = load i32, ptr %r, align 4
  %or43 = or i32 %24, %and42
  store i32 %or43, ptr %r, align 4
  br label %if.end44

if.end44:                                         ; preds = %if.then41, %if.end39
  %25 = load i32, ptr %r, align 4
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
