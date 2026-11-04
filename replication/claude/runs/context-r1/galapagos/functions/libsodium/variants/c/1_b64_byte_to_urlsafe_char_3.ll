; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_3.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_3.c"
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
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %add = add i32 %0, -26
  %shr = lshr i32 %add, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %add1 = add i32 %1, -52
  %shr2 = lshr i32 %add1, 8
  %and3 = and i32 %shr2, 255
  store i32 %and3, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %add4 = add i32 %2, -62
  %shr5 = lshr i32 %add4, 8
  %and6 = and i32 %shr5, 255
  store i32 %and6, ptr %c, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %not = xor i32 %xor, -1
  %add7 = add i32 %not, 1
  %shr8 = lshr i32 %add7, 8
  %and9 = and i32 %shr8, 255
  %xor10 = xor i32 %and9, 255
  store i32 %xor10, ptr %d, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor11 = xor i32 %4, 63
  %not12 = xor i32 %xor11, -1
  %add13 = add i32 %not12, 1
  %shr14 = lshr i32 %add13, 8
  %and15 = and i32 %shr14, 255
  %xor16 = xor i32 %and15, 255
  store i32 %xor16, ptr %e, align 4
  %5 = load i32, ptr %e, align 4
  %and17 = and i32 %5, 95
  %6 = load i32, ptr %d, align 4
  %and18 = and i32 %6, 45
  %or = or i32 %and17, %and18
  %7 = load i32, ptr %b, align 4
  %xor19 = xor i32 %7, 255
  %8 = load i32, ptr %c, align 4
  %and20 = and i32 %xor19, %8
  %9 = load i32, ptr %x.addr, align 4
  %add21 = add i32 %9, -4
  %and22 = and i32 %and20, %add21
  %or23 = or i32 %or, %and22
  %10 = load i32, ptr %a, align 4
  %xor24 = xor i32 %10, 255
  %11 = load i32, ptr %b, align 4
  %and25 = and i32 %xor24, %11
  %12 = load i32, ptr %x.addr, align 4
  %add26 = add i32 %12, 71
  %and27 = and i32 %and25, %add26
  %or28 = or i32 %or23, %and27
  %13 = load i32, ptr %a, align 4
  %14 = load i32, ptr %x.addr, align 4
  %add29 = add i32 %14, 65
  %and30 = and i32 %13, %add29
  %or31 = or i32 %or28, %and30
  ret i32 %or31
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
