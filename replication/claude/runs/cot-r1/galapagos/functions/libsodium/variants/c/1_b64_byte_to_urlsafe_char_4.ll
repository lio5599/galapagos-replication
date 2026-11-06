; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_4.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_4.c"
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
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %cmp = icmp ult i32 %0, 26
  %conv = zext i1 %cmp to i32
  %1 = load i32, ptr %x.addr, align 4
  %add = add i32 %1, 65
  %mul = mul i32 %conv, %add
  %2 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %2, 26
  %cmp1 = icmp ult i32 %sub, 26
  %conv2 = zext i1 %cmp1 to i32
  %3 = load i32, ptr %x.addr, align 4
  %add3 = add i32 %3, 71
  %mul4 = mul i32 %conv2, %add3
  %add5 = add i32 %mul, %mul4
  %4 = load i32, ptr %x.addr, align 4
  %sub6 = sub i32 %4, 52
  %cmp7 = icmp ult i32 %sub6, 10
  %conv8 = zext i1 %cmp7 to i32
  %5 = load i32, ptr %x.addr, align 4
  %sub9 = sub i32 %5, 4
  %mul10 = mul i32 %conv8, %sub9
  %add11 = add i32 %add5, %mul10
  %6 = load i32, ptr %x.addr, align 4
  %cmp12 = icmp eq i32 %6, 62
  %conv13 = zext i1 %cmp12 to i32
  %mul14 = mul i32 %conv13, 45
  %add15 = add i32 %add11, %mul14
  %7 = load i32, ptr %x.addr, align 4
  %cmp16 = icmp eq i32 %7, 63
  %conv17 = zext i1 %cmp16 to i32
  %mul18 = mul i32 %conv17, 95
  %add19 = add i32 %add15, %mul18
  ret i32 %add19
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
