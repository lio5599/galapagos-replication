; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_9.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_9.c"
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
  %s26 = alloca i32, align 4
  %s52 = alloca i32, align 4
  %s62 = alloca i32, align 4
  %y62 = alloca i32, align 4
  %y63 = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  store i32 %sub, ptr %s26, align 4
  %1 = load i32, ptr %s26, align 4
  %sub1 = sub i32 %1, 26
  store i32 %sub1, ptr %s52, align 4
  %2 = load i32, ptr %s52, align 4
  %sub2 = sub i32 %2, 10
  store i32 %sub2, ptr %s62, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  store i32 %xor, ptr %y62, align 4
  %4 = load i32, ptr %y62, align 4
  %xor3 = xor i32 %4, 1
  store i32 %xor3, ptr %y63, align 4
  %5 = load i32, ptr %s26, align 4
  %shr = lshr i32 %5, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %a, align 4
  %6 = load i32, ptr %s52, align 4
  %shr4 = lshr i32 %6, 8
  %and5 = and i32 %shr4, 255
  store i32 %and5, ptr %b, align 4
  %7 = load i32, ptr %s62, align 4
  %shr6 = lshr i32 %7, 8
  %and7 = and i32 %shr6, 255
  store i32 %and7, ptr %c, align 4
  %8 = load i32, ptr %y62, align 4
  %sub8 = sub i32 %8, 1
  %shr9 = lshr i32 %sub8, 8
  %and10 = and i32 %shr9, 255
  store i32 %and10, ptr %d, align 4
  %9 = load i32, ptr %y63, align 4
  %sub11 = sub i32 %9, 1
  %shr12 = lshr i32 %sub11, 8
  %and13 = and i32 %shr12, 255
  store i32 %and13, ptr %e, align 4
  %10 = load i32, ptr %d, align 4
  %and14 = and i32 %10, 45
  %11 = load i32, ptr %a, align 4
  %12 = load i32, ptr %x.addr, align 4
  %add = add i32 %12, 65
  %and15 = and i32 %11, %add
  %or = or i32 %and14, %and15
  %13 = load i32, ptr %e, align 4
  %and16 = and i32 %13, 95
  %or17 = or i32 %or, %and16
  %14 = load i32, ptr %b, align 4
  %15 = load i32, ptr %a, align 4
  %xor18 = xor i32 %15, 255
  %and19 = and i32 %14, %xor18
  %16 = load i32, ptr %x.addr, align 4
  %add20 = add i32 %16, 71
  %and21 = and i32 %and19, %add20
  %or22 = or i32 %or17, %and21
  %17 = load i32, ptr %c, align 4
  %18 = load i32, ptr %b, align 4
  %xor23 = xor i32 %18, 255
  %and24 = and i32 %17, %xor23
  %19 = load i32, ptr %x.addr, align 4
  %sub25 = sub i32 %19, 4
  %and26 = and i32 %and24, %sub25
  %or27 = or i32 %or22, %and26
  ret i32 %or27
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
