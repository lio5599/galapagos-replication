; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_5.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_5.c"
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
  %m26 = alloca i32, align 4
  %m52 = alloca i32, align 4
  %m62 = alloca i32, align 4
  %e62 = alloca i32, align 4
  %e63 = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %m26, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  store i32 %and3, ptr %m52, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %2, 62
  %shr5 = lshr i32 %sub4, 8
  %and6 = and i32 %shr5, 255
  store i32 %and6, ptr %m62, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %not = xor i32 %xor, -1
  %add = add i32 %not, 1
  %shr7 = lshr i32 %add, 8
  %and8 = and i32 %shr7, 255
  %xor9 = xor i32 %and8, 255
  store i32 %xor9, ptr %e62, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor10 = xor i32 %4, 63
  %not11 = xor i32 %xor10, -1
  %add12 = add i32 %not11, 1
  %shr13 = lshr i32 %add12, 8
  %and14 = and i32 %shr13, 255
  %xor15 = xor i32 %and14, 255
  store i32 %xor15, ptr %e63, align 4
  %5 = load i32, ptr %m26, align 4
  %6 = load i32, ptr %x.addr, align 4
  %add16 = add i32 %6, 65
  %and17 = and i32 %5, %add16
  %7 = load i32, ptr %m26, align 4
  %xor18 = xor i32 %7, 255
  %8 = load i32, ptr %m52, align 4
  %and19 = and i32 %xor18, %8
  %9 = load i32, ptr %x.addr, align 4
  %add20 = add i32 %9, 71
  %and21 = and i32 %and19, %add20
  %or = or i32 %and17, %and21
  %10 = load i32, ptr %m52, align 4
  %xor22 = xor i32 %10, 255
  %11 = load i32, ptr %m62, align 4
  %and23 = and i32 %xor22, %11
  %12 = load i32, ptr %x.addr, align 4
  %sub24 = sub i32 %12, 4
  %and25 = and i32 %and23, %sub24
  %or26 = or i32 %or, %and25
  %13 = load i32, ptr %e62, align 4
  %and27 = and i32 %13, 45
  %or28 = or i32 %or26, %and27
  %14 = load i32, ptr %e63, align 4
  %and29 = and i32 %14, 95
  %or30 = or i32 %or28, %and29
  ret i32 %or30
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
